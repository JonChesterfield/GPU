#ifndef TOKEN_ALLOCATE_HPP
#define TOKEN_ALLOCATE_HPP

#include <assert.h>
#include <stdint.h>
#include <stdio.h>

// Somewhat esoteric allocator thing.
// alloc() will return a unique value in [0, N)
// free() will return that value to the pool
// Encoding awkwardness is to use fetch_or instead of CAS to allocate
// and to use a zero-initialised backing array

template <uint32_t N> struct token_allocate {
  // Roughly a MPMC queue which starts out full, containing elements [0 N)
  token_allocate() {
    _Static_assert(N != 0, "");
    _Static_assert(N < UINT32_MAX / 2, "");
  }

  // Conceptually this contains an array initialised with  {0, 1, 2, ..., N-1}
  // and hands out elements from that array one at a time. However initialising
  // the array with zeros is much easier (particularly if N is a runtime value
  // and this is allocated in GPU local memory) so instead the array elements
  // are delta encoded relative to their initial position in the array.
  // Also the low bit is reserved to indicate whether the array element has
  // been handed out already or not. Hence encode/decode.
  static bool available(uint32_t v) { return (v & 1) == 0; }
  static uint32_t encode(uint32_t value, uint32_t index) {
    return (value - index) << 1u;
  }
  static uint32_t decode(uint32_t value, uint32_t index) {
    return index + (value >> 1u);
  }

  // Linear scan looking for an element which has the low bit clear. There will
  // be one in the data array somewhere as number threads <= N and each thread
  // allocates at most one of these integers at a time.
  // The low bit in the word handles mutex. If the value is already allocated
  // fetch-or is a no-op. Alloc increases head by exactly one each call, so the
  // next call to alloc will fetch_or to the next index.
  // If scheduling is unlucky, the value under index may be claimed by another
  // thread that has wrapped around the data array, in which case fetch_or is
  // still correct, just slower.
  uint32_t alloc() {
    uint32_t index = __atomic_fetch_add(&head, 1, __ATOMIC_ACQ_REL) % N;
    for (;;) {
      index %= N;
      uint32_t before = __atomic_fetch_or(&data[index], 1, __ATOMIC_ACQ_REL);
      uint64_t res = decode(before, index);
      index++;
      if (available(before)) {
        return res;
      }
    }
  }

  // Linear scan for the first index where the allocated value can be
  // re-inserted. Like alloc(), if the fetch_add is sufficiently stale for
  // another thread to have wrapped around this will be slow but still correct.
  // Index adjustment is scattered around to minimise the number of basic blocks
  // in codegen.
  // This can't use fetch_and to clear the low bit and write to the payload as
  // the value in the data array is unknown, and clearing the low bit separate
  // to writing the payload races with alloc.
  void free(uint32_t x) {
    uint32_t index = __atomic_fetch_add(&tail, 1, __ATOMIC_ACQ_REL);
    index--;
    for (;;) {
      index++;
      index %= N;
      uint32_t current = __atomic_load_n(&data[index], __ATOMIC_RELAXED);
      if (!available(current)) {
        uint32_t propose = encode(x, index);
        assert(available(propose));

        bool succeeded = __atomic_compare_exchange_n(
            &data[index], &current, propose, /* weak */ true, __ATOMIC_ACQ_REL,
            __ATOMIC_RELAXED);

        uint32_t cas_got = current;
        if (!available(cas_got)) {         
          index--; // Can try the current slot again
        }

        if (succeeded) {
          return;
        }
      }
    }
  }

  void dump() {
    printf("Head %u Tail %u N %u\n", head, tail, N);
    for (unsigned i = 0; i < N; i++) {
      printf("data[%u] = %u, encodes %u\n", i, data[i], i + (data[i] >> 1));
    }
  }

  uint32_t head = 0;
  uint32_t tail = 0;
  uint32_t data[N] = {0};
};

#endif

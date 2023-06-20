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
  token_allocate() {
    _Static_assert(N != 0, "");
    _Static_assert(N < UINT32_MAX/2, "");
  }

  static void inc(uint32_t &x) { x = (x + 1u) % N; }

  static uint32_t encode(uint32_t value, uint32_t index) {
    return (value - index) << 1u;
  }

  static uint32_t decode(uint32_t value, uint32_t index) {
    return index + (value >> 1u);
  }

  static bool element_available(uint32_t v) { return (v & 1) == 0; }

  void dump() {
    printf("Head %u Tail %u N %u\n", head, tail, N);
    for (unsigned i = 0; i < N; i++) {
      printf("data[%u] = %u, encodes %u\n", i, data[i], i + (data[i] >> 1));
    }
  }
  
  uint32_t alloc() {
    uint32_t index = __atomic_fetch_add(&head, 1, __ATOMIC_ACQ_REL) % N;

    for (;;) {
      uint32_t before = __atomic_fetch_or(&data[index], 1, __ATOMIC_ACQ_REL);
      if (element_available(before)) {
        return decode(before, index);
      } else {
        inc(index);
      }
    }
  }

  void free(uint32_t x) {
    uint32_t index = __atomic_fetch_add(&tail, 1, __ATOMIC_ACQ_REL) % N;

    for (;;) {
      uint32_t current = __atomic_load_n(&data[index], __ATOMIC_RELAXED);
      if (!element_available(current)) {
        uint32_t propose = encode(x, index);
        assert(element_available(propose));

        // weak is fine
        bool succeeded =
            __atomic_compare_exchange_n(&data[index], &current, propose, true,
                                        __ATOMIC_ACQ_REL, __ATOMIC_RELAXED);
        if (succeeded) {
          return;
        }

        uint32_t cas_got = current;
        if (element_available(cas_got)) {
          // Failed and there's something in the slot
          inc(index);
        } else {
          // CAS failed, but the slot doesn't have anything in it, can try again
        }
      } else {
        inc(index);
      }
    }
  }

  uint32_t head = 0;
  uint32_t tail = 0;
  uint32_t data[N] = {0};
};

#endif

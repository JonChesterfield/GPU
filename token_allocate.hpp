#ifndef TOKEN_ALLOCATE_HPP
#define TOKEN_ALLOCATE_HPP

#include <stdint.h>
#include <stdio.h>
#include <assert.h>

template <uint32_t N>
struct token_allocate
{
  token_allocate() {
    _Static_assert(N != 0, "");
    _Static_assert(N != UINT32_MAX, "");
    _Static_assert((N & (N - 1)) == 0, "N is power of two"); 
  }

  uint32_t alloc() {
    uint32_t index = guess_head_index();
      
  again:;
    uint32_t before = __atomic_fetch_or(&data[index], 1, __ATOMIC_ACQ_REL);
    if (!element_available(before)) {
      index++;
      index %= N;
      goto again;
    }
    // low bit is now set
    assert(element_available(before));
    assert(!index_available(index)); // but isn't now
    return index + (before >> 1);
  }
  void free(uint32_t x) {
    uint32_t index = guess_tail_index();
  again:
    uint32_t current = __atomic_load_n(&data[index], __ATOMIC_RELAXED);
    if (element_available(current))
      {
        // Looking for a slot thaat doesn't have a value in it already
        index++;
        index %= N;
        goto again;
      }

    // Got an entry with low bit clear
    uint32_t propose = (x - index) << 1;
    assert(!element_available(current));
    assert(element_available(propose));
    
    bool succeeded = __atomic_compare_exchange_n(&data[index], &current, propose, true, __ATOMIC_ACQ_REL, __ATOMIC_RELAXED);
    if (succeeded) {
      return;
    }
    
    uint32_t cas_got = current;
    if (element_available(cas_got)) {
      // Failed and there's something in the slot
      index++;
      index %= N;
      goto again;
    } else {
      // Failed, but the slot doesn't have anything in it
      goto again;
    }
  }

  uint32_t guess_head_index() {
    return __atomic_fetch_add(&head, 1, __ATOMIC_ACQ_REL) % N;
  }

  uint32_t guess_tail_index() {
    return __atomic_fetch_add(&tail, 1, __ATOMIC_ACQ_REL) % N;
  }
  
  uint32_t head = 0;
  uint32_t tail = 0;
  uint32_t data[N] = {0};

  bool element_available(uint32_t v) {
    return (v & 1) == 0;
  }
  bool index_available(uint32_t x) {
    return element_available(__atomic_load_n(&data[x], __ATOMIC_RELAXED));
  }
  void dump()
  {
    printf("Head %u Tail %u N %u\n", head, tail, N);
    for (unsigned i = 0; i < N; i++) {
      printf("data[%u] = %u, encodes %u\n", i, data[i], i + (data[i]>>1));
    }

  }
};

#endif

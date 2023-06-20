#ifndef TOKEN_ALLOCATE_HPP
#define TOKEN_ALLOCATE_HPP

#include <stdint.h>

template <uint32_t N>
struct token_allocate
{
  token_allocate() {
    _Static_assert(N != 0, "");
    _Static_assert((N & (N - 1)) == 0, "N is power of two"); 
  }

  uint32_t alloc() { return 0; }
  void free(uint32_t) {}
  
  uint32_t head = 0;
  uint32_t tail = 0;
  uint32_t data[N] = {0};
};

#endif

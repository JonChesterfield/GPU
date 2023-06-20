#include "token_allocate.hpp"

enum {N = 32};

extern "C"
uint32_t alloc(token_allocate<N> & a)
{
  return a.alloc();
}

extern "C"
void free(token_allocate<N> & a, uint32_t v)
{
  a.free(v);
}

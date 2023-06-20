#include <stdio.h>
#include <stdlib.h>

#include "token_allocate.hpp"
#include "thirdparty/EvilUnit/EvilUnit.h"


MAIN_MODULE()
{

  TEST("allocate all then free all")
    {
      enum {N = 8};
      token_allocate<N> a;
      uint32_t vals[N];
      for (unsigned i = 0 ; i < N; i++)
        {
          uint32_t value = a.alloc();
          CHECK(i == value);
          vals[i] = value;
        }
      for (unsigned i = 0 ; i < N; i++)
        {
          uint32_t value = vals[i];
          a.free(value);
        }
    }
  
  TEST("init & walk once")
    {
      enum {N = 4};
      token_allocate<N> a;
      for (unsigned i = 0 ; i < N; i++)
        {
          uint32_t value = a.alloc();
          CHECK(i == value);
          a.free(value);
        }
    }

  TEST("init and walk twice")
    {
      enum {N = 8};
      token_allocate<N> a;
      for (unsigned i = 0 ; i < N; i++)
        {
          uint32_t value = a.alloc();
          CHECK(i == value);
          a.free(value);
        }      
      for (unsigned i = 0 ; i < N; i++)
        {
          uint32_t value = a.alloc();
          CHECK(i == value);
          a.free(value);
        }      
    }

  TEST("staggered alloc/free")
    {
      enum {N = 16};
      token_allocate<N> a;
      CHECK(a.alloc() == 0);
      printf("alloc 0\n");
      for (unsigned i = 1; i < N/2; i++)
        {
          uint32_t prev = (2*i-2);
          uint32_t then = (2*i-1);
          uint32_t x = a.alloc();
          a.free(prev);
          uint32_t y = a.alloc();
          
          CHECK(x == 2*i-1);
          CHECK(y == 2*i);          
          a.free(then);
        }
    }
}

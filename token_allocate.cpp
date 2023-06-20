#include <stdio.h>

#include "token_allocate.hpp"
#include "thirdparty/EvilUnit/EvilUnit.h"


MAIN_MODULE()
{
  TEST("init & walk")
    {
      enum {N = 16};
      token_allocate<16> a;
      for (unsigned i = 0 ; i < N; i++)
        {

          uint32_t value = a.alloc();
          CHECK(i == value);
          a.free(value);
        }      
    }
}

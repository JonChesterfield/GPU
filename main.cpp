#include "write_to_stderr.hpp"

#include "src/__support/libc_assert.h"

#include "src/stdio/snprintf.h"
#include "src/stdio/fputs.h"

typedef __builtin_va_list va_list;
#define va_start(ap) __builtin_va_start(ap, 0)
#define va_end(ap)          __builtin_va_end(ap)
#define va_arg(ap, type)    __builtin_va_arg(ap, type)
#define va_copy(dest, src)  __builtin_va_copy(dest, src)



extern "C" void variadic_to_call_middle(uint32_t f, ...)
{
  va_list va;
  __builtin_va_start(va, 0);

  uint32_t x0 = va_arg(va, uint32_t);
  uint64_t x1 = va_arg(va, uint64_t);
  uint32_t x2 = va_arg(va, uint32_t);
  va_end(va);
  write_to_stderr(f);
  write_to_stderr(x0);
  write_to_stderr(x1);
  write_to_stderr(x2);

}

extern "C" void variadic_to_call_entry(uint32_t f, uint32_t x0, uint64_t x1, uint32_t x2)
{
  variadic_to_call_middle(f, x0, x1, x2);
}


__attribute__((always_inline))
__attribute__((visibility("default")))
extern "C" int main(int argc, char **argv, char **envp) {

  write_to_stderr("what the hell\n");
  write_to_stderr(42u);
  write_to_stderr(" middle\n");
  write_to_stderr(12u);

  variadic_to_call_entry(42, 101, 202, 303);

  //  __llvm_libc::report_assertion_failure("assert","filename",101,"funcname");

  write_to_stderr(" trailing\n");

  char buffer[64];
  snprintf(buffer, sizeof(buffer), "Hello World!\n");
  fputs(buffer, stdout);
  
  return 42; }

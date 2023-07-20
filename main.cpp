#include "write_to_stderr.hpp"

#include "src/__support/libc_assert.h"



__attribute__((always_inline))
__attribute__((visibility("default")))
extern "C" int main(int argc, char **argv, char **envp) {

  write_to_stderr("what the hell\n");
  __llvm_libc::write_to_stderr(":");
  write_to_stderr(42u);
  __llvm_libc::write_to_stderr(":");
  write_to_stderr(" middle\n");
  write_to_stderr(12u);


  __llvm_libc::report_assertion_failure("assert","filename",101,"funcname");
  
  write_to_stderr(" trailing\n");
  
  return 42; }

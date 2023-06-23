#include "src/__support/OSUtil/gpu/io.h"
extern "C" int main() {
  if (1)
    __llvm_libc::write_to_stderr("Thing");
  return 42;
}

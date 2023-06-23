#include "src/__support/OSUtil/gpu/io.h"
extern "C" int main() {
    __llvm_libc::write_to_stderr("Thing writing\n");
  return 42;
}

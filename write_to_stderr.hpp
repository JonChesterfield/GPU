#ifndef WRITE_TO_STDERR
#define WRITE_TO_STDERR


#include "src/__support/OSUtil/gpu/io.h"

void write_to_stderr(__llvm_libc::cpp::string_view msg) {
  __llvm_libc::write_to_stderr(msg);
}

extern "C" void write_to_stderr(const char *msg) {
  __llvm_libc::write_to_stderr(msg);
}

#endif

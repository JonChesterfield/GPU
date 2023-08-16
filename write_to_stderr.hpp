#ifndef WRITE_TO_STDERR
#define WRITE_TO_STDERR

#include "src/__support/OSUtil/gpu/io.h"
#include "src/__support/integer_to_string.h"

void write_to_stderr(__llvm_libc::cpp::string_view msg) {
  __llvm_libc::write_to_stderr(msg);
}

void write_to_stderr(const char *msg) {
  __llvm_libc::write_to_stderr(msg);
}

void write_to_stderr(uint32_t val) {

  const __llvm_libc::IntegerToString<uint32_t> line_buffer(val);
  
  __llvm_libc::cpp::string_view view = line_buffer.view();
  __llvm_libc::write_to_stderr("<");
#if 1
  __llvm_libc::write_to_stderr(view);
#else
  __llvm_libc::write_to_stderr(line_str);
#endif
  __llvm_libc::write_to_stderr(">");
}

#endif

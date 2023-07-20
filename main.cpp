#include "write_to_stderr.hpp"

extern "C" int puts(const char*);

__attribute__((flatten))
int flatputs(const char* x)
{
  return puts(x);
}


__attribute__((always_inline))
__attribute__((visibility("default")))
extern "C" int main(int argc, char **argv, char **envp) {

  write_to_stderr("what the hell\n");

  return 42; }

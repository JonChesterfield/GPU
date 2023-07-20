


extern "C" int puts(const char*);

__attribute__((flatten))
int flatputs(const char* x)
{
  return puts(x);
}

extern "C" void write_to_stderr(const char *msg);

__attribute__((always_inline))
__attribute__((visibility("default")))
extern "C" int cmain(int argc, char **argv, char **envp) {

  write_to_stderr("what the hell\n");

  return 42; }

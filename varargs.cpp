
typedef __builtin_va_list va_list;

#define va_copy(dest, src) __builtin_va_copy(dest, src)
#define va_start(ap, ...) __builtin_va_start(ap, 0)
#define va_end(ap) __builtin_va_end(ap)
#define va_arg(ap, type) __builtin_va_arg(ap, type)

// newer compilers don't need the wip thing

template <typename A>
A middle(void* wip, ...)
{
  va_list va;
  __builtin_va_start(va, wip);
  A x = va_arg(va, A);
  va_end(va);
  return x;
}

template <typename R>
R outer(R x)
{
  R tmp = middle<R>(nullptr, x);
  return tmp;
}


template <typename R>
bool check(R x)
{
  R y = outer<R>(x);
  return x == y;
}


extern "C" int main()
{
  int c = 0;
  
  if (1)
  {
    c++;
    int x = 42;
    bool p = check(x);
    if (!p) return c;
  }

  if (1)
  {
    c++;
    unsigned long x = ~(4004ul);
    bool p = check(x);
    if (!p) return c;
  }


  if (1)
  {
    c++;
    double x = 3.2;
    bool p = check(x);
    if (!p) return c;
  }

  return 0;
}

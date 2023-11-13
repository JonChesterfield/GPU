typedef __builtin_va_list va_list;
#define va_copy(dest, src) __builtin_va_copy(dest, src)
#define va_start(ap, ...) __builtin_va_start(ap, 0)
#define va_end(ap) __builtin_va_end(ap)
#define va_arg(ap, type) __builtin_va_arg(ap, type)
#define NOINLINE __attribute__((noinline))

template <typename A>
NOINLINE A f__v__middle(...)
{
  va_list va;
  __builtin_va_start(va, 0);
  A x = va_arg(va, A);
  va_end(va);
  return x;
}

template <typename A>
NOINLINE A f__v__outer(A x)
{
  A tmp = f__v__middle<A>(x);
  return tmp;
}

NOINLINE bool f__v__check(void)
{
  using T = int;
  T x = 42;
  T y = f__v__outer<T>(x);
  return x == y;
}

template <typename A>
NOINLINE A f_i_v__middle(int x0, ...)
{
  va_list va;
  __builtin_va_start(va, 0);
  A x = va_arg(va, A);
  va_end(va);
  return x;
}

template <typename A>
NOINLINE A f_i_v__outer(A x)
{
  A tmp = f_i_v__middle<A>(0, x);
  return tmp;
}

NOINLINE bool f_i_v__check(void)
{
  using T = int;
  T x = 21;
  T y = f_i_v__outer<T>(x);
  return x == y;
}

template <typename A>
NOINLINE A f__v_i_middle(...)
{
  va_list va;
  __builtin_va_start(va, 0);
  A x = va_arg(va, A);
  va_end(va);
  return x;
}

template <typename A>
NOINLINE A f__v_i_outer(A x)
{
  A tmp = f__v_i_middle<A>(0, x);
  return tmp;
}

NOINLINE bool f__v_i_check(void)
{
  using T = int;
  T x = 101;
  T y = f__v_i_outer<T>(x);
  return x == y;
}

template <typename A>
NOINLINE A f_ifd_v_ff_middle(int x0, float x1, double x2, ...)
{
  va_list va;
  __builtin_va_start(va, 0);
  A x = va_arg(va, A);
  va_end(va);
  return x;
}

template <typename A>
NOINLINE A f_ifd_v_ff_outer(A x)
{
  A tmp = f_ifd_v_ff_middle<A>(0, 0.0f, 0.0, 0.0f, 0.0f, x);
  return tmp;
}

NOINLINE bool f_ifd_v_ff_check(void)
{
  using T = int;
  T x = 42;
  T y = f_ifd_v_ff_outer<T>(x);
  return x == y;
}

extern "C"
int main()
{
  if (!f__v__check()) { return 1;}
  if (!f_i_v__check()) { return 2;}
  if (!f__v_i_check()) { return 3;}
  if (!f_ifd_v_ff_check()) { return 4;}
  return 0;
}


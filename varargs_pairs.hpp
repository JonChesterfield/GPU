#ifndef VARARGS_PAIRS_HPP_INCLUDED
#define VARARGS_PAIRS_HPP_INCLUDED

typedef __builtin_va_list va_list;
#define va_copy(dest, src) __builtin_va_copy(dest, src)
#define va_start(ap, ...) __builtin_va_start(ap, 0)
#define va_end(ap) __builtin_va_end(ap)
#define va_arg(ap, type) __builtin_va_arg(ap, type)

#define HAS_IOSTREAM 0

// llvm can optimise out the calls entirely, this is a way
// to encourage the lowering to execute at runtime
#define FUNCTION_ATTRIBUTE static  __attribute__((noinline))

#if HAS_IOSTREAM
#include <iostream>
#endif

//__attribute__((used))
static void init_valist(void *buffer, va_list *);

//__attribute__((used))
static char *open_valist(va_list);

#ifdef __x86_64
// The abi spec says if the alignment needed exceeds 8, align to a 16 byte
// boundary clang doesn't do that - if the type alignment > 8, it aligns to the
// type alignment

#define MIN_SLOT_ALIGN 8
#define MAX_SLOT_ALIGN 0
static void init_valist(void *buffer, va_list *out) {
  (*out)[0].gp_offset = 48;
  (*out)[0].fp_offset = 6 * 8 + 8 * 16;
  (*out)[0].overflow_arg_area = buffer;
  (*out)[0].reg_save_area = 0;
}

//__attribute__((used))
static char *open_valist(va_list va) {
  return (char *)(va[0].overflow_arg_area);
}

#if HAS_IOSTREAM
static std::ostream &operator<<(std::ostream &os, va_list const &rhs) {
  os << "{";
  os << rhs[0].gp_offset;
  os << " ";
  os << rhs[0].fp_offset;
  os << " ";
  os << rhs[0].overflow_arg_area;
  os << " ";
  os << rhs[0].reg_save_area;
  os << "}";
  return os;
}
#endif

#endif

#ifdef __i386__
#define MIN_SLOT_ALIGN 4
#define MAX_SLOT_ALIGN 0
static void init_valist(void *BUFFER, va_list *out) { *out = (char *)BUFFER; }

//__attribute__((used))
static char *open_valist(va_list va) { return (char *)va; }
#endif

#ifdef __AMDGPU__
#define MIN_SLOT_ALIGN 4
#define MAX_SLOT_ALIGN 4
static void init_valist(void *BUFFER, va_list *out) { *out = (char *)BUFFER; }

//__attribute__((used))
static char *open_valist(va_list va) { return (char *)va; }
#endif

static unsigned distance(va_list before, va_list after) {
  char *before_ptr = open_valist(before);
  char *after_ptr = open_valist(after);
  return after_ptr - before_ptr;
}

#if !defined(MIN_SLOT_ALIGN) || !defined(MAX_SLOT_ALIGN)
#error "Missing arch definition"
#endif

// Minimum is greater than 0
// Max might be = to zero to indicate no bound
static_assert(MIN_SLOT_ALIGN > 0, "");

typedef float __m128 __attribute__((__vector_size__(16), __aligned__(16)));
typedef float __m256 __attribute__((__vector_size__(32), __aligned__(32)));

static_assert(alignof(__m128) == 16, "");
static_assert(alignof(__m256) == 32, "");

template <typename T, typename U> struct pair {
  T first;
  U second;
};

static bool eq(__m128 lhs, __m128 rhs) {
  bool eq = true;
  for (unsigned i = 0; i < 4; i++) {
    eq &= lhs[i] == rhs[i];
  }
  return eq;
}

static bool eq(__m256 lhs, __m256 rhs) {
  bool eq = true;
  for (unsigned i = 0; i < 8; i++) {
    eq &= lhs[i] == rhs[i];
  }
  return eq;
}

// An instance used by the libc testing
struct libcS {
  char c;
  short s;
  int i;
  long l;
  float f;
  double d;
};

template <typename T> static bool eq(T x, T y) { return x == y; }

static bool eq(libcS x, libcS y) {
  return eq(x.c, y.c) & eq(x.s, y.s) & eq(x.i, y.i) & eq(x.l, y.l) &
         eq(x.f, y.f) & eq(x.d, y.d);
}

template <typename T, typename U> static bool eq(pair<T, U> x, pair<T, U> y) {
  return eq(x.first, y.first) & eq(x.second, y.second);
}

#if HAS_IOSTREAM
namespace {
std::ostream &operator<<(std::ostream &os, __m128 const &rhs) {
  os << "{";
  os << rhs[0];
  for (unsigned i = 1; i < 4; i++) {
    os << ", ";
    os << rhs[i];
  }
  os << "}";
  return os;
}

std::ostream &operator<<(std::ostream &os, __m256 const &rhs) {
  os << "{";
  os << rhs[0];
  for (unsigned i = 1; i < 8; i++) {
    os << ", ";
    os << rhs[i];
  }
  os << "}";
  return os;
}

template <typename T, typename U>
std::ostream &operator<<(std::ostream &os, pair<T, U> const &rhs) {
  os << "[";
  os << rhs.first;
  os << ", ";
  os << rhs.second;
  os << "]";
  return os;
}
} // namespace
#endif

namespace {

// same one used by libc tests
void init(libcS *x) { *x = (libcS){'\x1', 2, 3, 4l, 5.0f, 6.0}; }

void init(float *x) { *x = 13.14; }
void init(short *x) { *x = 101; }
void init(char *x) { *x = 42; }

void init(double *x) { *x = 3.14; }

void init(int *x) { *x = 7; }

void init(long *x) { *x = 77; }

void init(__m128 *x) {
  (*x)[0] = 1.0f;
  (*x)[1] = 2.0f;
  (*x)[2] = 3.0f;
  (*x)[3] = 4.0f;
}

void init(__m256 *x) {
  (*x)[0] = 4.0f;
  (*x)[1] = 3.0f;
  (*x)[2] = 2.0f;
  (*x)[3] = 1.0f;
  (*x)[4] = 5.0f;
  (*x)[5] = 6.0f;
  (*x)[6] = 7.0f;
  (*x)[7] = 18.0f;
}

template <typename T, typename U> void init(pair<T, U> *x) {
  init(&(x->first));
  init(&(x->second));
}
} // namespace

template <unsigned x, unsigned y> static constexpr unsigned min() {
  return x < y ? x : y;
}

template <unsigned x, unsigned y> static constexpr unsigned max() {
  return x < y ? y : x;
}

template <typename X, typename Y> static constexpr unsigned get_align() {
  constexpr unsigned of_types = max<alignof(X), alignof(Y)>();
  return MAX_SLOT_ALIGN ? min<of_types, MAX_SLOT_ALIGN>() : of_types;
}

template <typename X, typename Y> static constexpr unsigned get_pad() {
  constexpr unsigned offset = sizeof(X);

  constexpr unsigned type_align = max<alignof(Y), MIN_SLOT_ALIGN>();

  constexpr unsigned capped_type_align =
      MAX_SLOT_ALIGN ? min<type_align, MAX_SLOT_ALIGN>() : type_align;

  constexpr unsigned Rem = offset % capped_type_align;

  constexpr unsigned Padding = capped_type_align - Rem;

  return Rem == 0 ? 0 : Padding;
}



// packed structs have aligment of 1
// even if attribute applied to struct (presumably a bug)
// can sometimes set alignment on the first field, but that can run into
// error: requested alignment is less than minimum alignment of 8 for type
// so we're stuck with a type_align field and setting alignment on instances
template <typename X, typename Y, unsigned pad>
struct __attribute__((packed)) buffer_type;

template <typename X, typename Y>
struct __attribute__((packed)) buffer_type<X, Y, 0u> {
  buffer_type(X x, Y y) : x(x), y(y) {};
  buffer_type() {}
  X x;
  Y y;
  enum {type_align = get_align<X, Y>()};
};

template <typename X, typename Y, unsigned pad>
struct __attribute__((packed)) buffer_type {
  buffer_type(X x, Y y) : x(x), _p{}, y(y) {};
  buffer_type() {}
  X x;
  char _p[pad];
  Y y;
  enum {type_align = get_align<X, Y>()};
};

namespace {

template <typename X, typename Y> void layout() {
#if HAS_IOSTREAM
  constexpr unsigned p = get_pad<X, Y>();
  using type = buffer_type<X, Y, p>;
  std::cout << "layout\n";
  std::cout << "{X " << sizeof(X) << ", " << alignof(X) << ", "
            << offsetof(type, x) << "}\n";
  std::cout << "{pad char[" << p << "]}\n";

  std::cout << "{Y " << sizeof(Y) << ", " << alignof(Y) << ", "
            << offsetof(type, y) << "}\n";

  std::cout << "Buffer size,align " << sizeof(type) << "," << alignof(type)
            << "\n\n";
#endif
}

template <typename X, typename Y> void describe() {
  using T = buffer_type<X, Y, get_pad<X, Y>()>;
  alignas(T::type_align) T buffer;
  va_list va;
  init_valist((void *)&buffer, &va);

#if HAS_IOSTREAM
  std::cout << "va0 " << va << "\n";
  char *buffer_addr = (char *)&buffer;
#endif

#if HAS_IOSTREAM
  long first_addr = open_valist(va) - buffer_addr;
#endif

  va_arg(va, X);

#if HAS_IOSTREAM
  std::cout << "va1 " << va << "\n";
  long second_addr = open_valist(va) - buffer_addr;
#endif

  va_arg(va, Y);

#if HAS_IOSTREAM
  std::cout << "va2 " << va << "\n";
  long third_addr = open_valist(va) - buffer_addr;
#endif

#if HAS_IOSTREAM
  std::cout << "{" << first_addr << " " << second_addr << " " << third_addr
            << "}\n";
#endif
}

template <typename X, typename Y> FUNCTION_ATTRIBUTE X get_first(va_list va) {
  return va_arg(va, X);
}

template <typename X, typename Y> FUNCTION_ATTRIBUTE Y get_second(va_list va) {
  va_arg(va, X);
  return va_arg(va, Y);
}

template <typename X, typename Y> FUNCTION_ATTRIBUTE X variadic_get_first(...) {
  va_list va;
  __builtin_va_start(va, 0);
  X r = va_arg(va, X);
  va_end(va);
  return r;
}

template <typename X, typename Y>
FUNCTION_ATTRIBUTE Y variadic_get_second(...) {
  va_list va;
  __builtin_va_start(va, 0);
  va_arg(va, X);
  Y r = va_arg(va, Y);
  va_end(va);
  return r;
}

template <typename X, typename Y>
FUNCTION_ATTRIBUTE bool variadic_can_get_first(X x, Y y) {
  X r = variadic_get_first<X, Y>(x, y);
  return eq(r, x);
}

template <typename X, typename Y>
FUNCTION_ATTRIBUTE bool variadic_can_get_second(X x, Y y) {
  Y r = variadic_get_second<X, Y>(x, y);
  return eq(r, y);
}

template <typename X, typename Y>
FUNCTION_ATTRIBUTE bool can_get_first(X x, Y y) {
  using T = buffer_type<X, Y, get_pad<X, Y>()>;
  alignas(T::type_align) T buffer (x, y);
  
  va_list va;
  init_valist((void *)&buffer, &va);

  X f = get_first<X, Y>(va);

  bool e = eq(f, x);

#if HAS_IOSTREAM
  std::cout << "first"
            << "\n";
  std::cout << x << "\n";
  std::cout << y << "\n";
  std::cout << f << "\n";
  std::cout << e << "\n";
  std::cout << "\n";
#endif

  va_end(va);

  return e;
}

template <typename X, typename Y>
FUNCTION_ATTRIBUTE bool can_get_second(X x, Y y) {
  using T = buffer_type<X, Y, get_pad<X, Y>()>;
  alignas(T::type_align) T buffer (x, y);

  va_list va;
  init_valist((void *)&buffer, &va);

  Y f = get_second<X, Y>(va);

  bool e = eq(f, y);
#if HAS_IOSTREAM
  std::cout << "second"
            << "\n";
  std::cout << x << "\n";
  std::cout << y << "\n";
  std::cout << f << "\n";
  std::cout << e << "\n";
  std::cout << "\n";
#endif

  va_end(va);

  return e;
}

template <typename X, typename Y>
FUNCTION_ATTRIBUTE
bool check_va_arg() {
  X x;
  Y y;

  init(&x);
  init(&y);

  layout<X, Y>();
  describe<X, Y>();

  bool f = can_get_first<X, Y>(x, y);
  bool s = can_get_second<X, Y>(x, y);

  return f & s;
}

template <typename X, typename Y>
FUNCTION_ATTRIBUTE
bool variadic_check_va_arg() {
  X x;
  Y y;

  init(&x);
  init(&y);

  bool f = variadic_can_get_first<X, Y>(x, y);
  bool s = variadic_can_get_second<X, Y>(x, y);

  return f & s;
}

} // namespace

#if 0
extern "C" {
  int get_arg_int(va_list va) { return va_arg(va, int); }
  long get_arg_long(va_list va) { return va_arg(va, long); }
  double get_arg_double(va_list va) { return va_arg(va, double); }
  __m128 get_arg___m128(va_list va) { return va_arg(va, __m128); }
  __m256 get_arg___m256(va_list va) { return va_arg(va, __m256); }
}
#endif

#endif

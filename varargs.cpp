typedef __builtin_va_list va_list;
#define va_copy(dest, src) __builtin_va_copy(dest, src)
#define va_start(ap, ...) __builtin_va_start(ap, 0)
#define va_end(ap) __builtin_va_end(ap)
#define va_arg(ap, type) __builtin_va_arg(ap, type)
#define NOINLINE // __attribute__((noinline))


__attribute__((used))
static void init_valist(void* buf, va_list*);

#if 0
struct x64_ref_inner
{
  unsigned gp_offset;
  unsigned fp_offset;
  void* overflow_arg_area;
  void* ref_save_area;
};

struct x64_ref
{
  x64_ref_inner val[1];
};

void ref_init_valist(void* buf, va_list* p)
{
  x64_ref* r = (x64_ref*)p;
  r->val[0].gp_offset = 48;
  r->val[0].fp_offset = 176;
  r->val[0].overflow_arg_area = buf;
  r->val[0].ref_save_area = nullptr;
}
#endif

#ifdef __x86_64
#define SLOT_ALIGN 8
static void init_valist(void* BUFFER, va_list * out)
{
  (*out)[0].gp_offset = 48;
  (*out)[0].fp_offset = 6 * 8 + 8 * 16;
  (*out)[0].overflow_arg_area = BUFFER;
  (*out)[0].reg_save_area = 0;
}
#endif

#ifdef __AMDGPU__
#define SLOT_ALIGN 4
static void init_valist(void* BUFFER, va_list *out)
{
  va_list VAPTR;
  __builtin_memcpy((char*)&VAPTR, &BUFFER, 8);
  __builtin_memcpy(out, &VAPTR, sizeof(va_list));
}
#endif




struct __attribute__((packed)) f__v__buffer 
{
  int val;
};


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
NOINLINE A f__v__ref_middle(va_list buffer)
{
  va_list va;
  __builtin_va_copy(va, buffer);
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

template <typename A>
NOINLINE A f__v__ref_outer(A x)
{
  f__v__buffer buffer = {
    .val = x,
  };
  va_list ptr;
  init_valist((void*)&buffer, &ptr);
  A tmp = f__v__ref_middle<A>(ptr);
  return tmp;
}


NOINLINE bool f__v__check(void)
{
  using T = int;
  T x = 42;
  T y = f__v__outer<T>(x);
  return x == y;
}

NOINLINE bool f__v__ref_check(void)
{
  using T = int;
  T x = 42;
  T y = f__v__ref_outer<T>(x);
  return x == y;
}



struct __attribute__((packed)) f_i_v__buffer 
{
  int val;
};


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
NOINLINE A f_i_v__ref_middle(int x0, va_list buffer)
{
  va_list va;
  __builtin_va_copy(va, buffer);
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

template <typename A>
NOINLINE A f_i_v__ref_outer(A x)
{
  f_i_v__buffer buffer = {
    .val = x,
  };
  va_list ptr;
  init_valist((void*)&buffer, &ptr);
  A tmp = f_i_v__ref_middle<A>(0, ptr);
  return tmp;
}


NOINLINE bool f_i_v__check(void)
{
  using T = int;
  T x = 21;
  T y = f_i_v__outer<T>(x);
  return x == y;
}

NOINLINE bool f_i_v__ref_check(void)
{
  using T = int;
  T x = 21;
  T y = f_i_v__ref_outer<T>(x);
  return x == y;
}



#if SLOT_ALIGN == 8
struct __attribute__((packed)) f__v_i_buffer 
{
  int x0;
  char pad0[4];
  int val;
};
#endif
#if SLOT_ALIGN == 4
struct __attribute__((packed)) f__v_i_buffer 
{
  int x0;
  int val;
};
#endif


template <typename A>
NOINLINE A f__v_i_middle(...)
{
  va_list va;
  __builtin_va_start(va, 0);
  va_arg(va, int);
  A x = va_arg(va, A);
  va_end(va);
  return x;
}

template <typename A>
NOINLINE A f__v_i_ref_middle(va_list buffer)
{
  va_list va;
  __builtin_va_copy(va, buffer);
  va_arg(va, int);
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

template <typename A>
NOINLINE A f__v_i_ref_outer(A x)
{
  f__v_i_buffer buffer = {
    .x0 = 0,
    .val = x,
  };
  va_list ptr;
  init_valist((void*)&buffer, &ptr);
  A tmp = f__v_i_ref_middle<A>(ptr);
  return tmp;
}


NOINLINE bool f__v_i_check(void)
{
  using T = int;
  T x = 101;
  T y = f__v_i_outer<T>(x);
  return x == y;
}

NOINLINE bool f__v_i_ref_check(void)
{
  using T = int;
  T x = 101;
  T y = f__v_i_ref_outer<T>(x);
  return x == y;
}



#if SLOT_ALIGN == 8
struct __attribute__((packed)) f_idd_v_idid_buffer 
{
  int x0;
  char pad0[4];
  double x1;
  int x2;
  char pad1[4];
  double x3;
  int val;
};
#endif
#if SLOT_ALIGN == 4
struct __attribute__((packed)) f_idd_v_idid_buffer 
{
  int x0;
  double x1;
  int x2;
  double x3;
  int val;
};
#endif


template <typename A>
NOINLINE A f_idd_v_idid_middle(int x0, double x1, double x2, ...)
{
  va_list va;
  __builtin_va_start(va, 0);
  va_arg(va, int);
  va_arg(va, double);
  va_arg(va, int);
  va_arg(va, double);
  A x = va_arg(va, A);
  va_end(va);
  return x;
}

template <typename A>
NOINLINE A f_idd_v_idid_ref_middle(int x0, double x1, double x2, va_list buffer)
{
  va_list va;
  __builtin_va_copy(va, buffer);
  va_arg(va, int);
  va_arg(va, double);
  va_arg(va, int);
  va_arg(va, double);
  A x = va_arg(va, A);
  va_end(va);
  return x;
}

template <typename A>
NOINLINE A f_idd_v_idid_outer(A x)
{
  A tmp = f_idd_v_idid_middle<A>(0, 0.0, 0.0, 0, 0.0, 0, 0.0, x);
  return tmp;
}

template <typename A>
NOINLINE A f_idd_v_idid_ref_outer(A x)
{
  f_idd_v_idid_buffer buffer = {
    .x0 = 0,
    .x1 = 0.0,
    .x2 = 0,
    .x3 = 0.0,
    .val = x,
  };
  va_list ptr;
  init_valist((void*)&buffer, &ptr);
  A tmp = f_idd_v_idid_ref_middle<A>(0, 0.0, 0.0, ptr);
  return tmp;
}


NOINLINE bool f_idd_v_idid_check(void)
{
  using T = int;
  T x = 42;
  T y = f_idd_v_idid_outer<T>(x);
  return x == y;
}

NOINLINE bool f_idd_v_idid_ref_check(void)
{
  using T = int;
  T x = 42;
  T y = f_idd_v_idid_ref_outer<T>(x);
  return x == y;
}


extern "C"
int main()
{
  if (!f__v__ref_check()) { return 1;}
  if (!f__v__check()) { return 2;}
  if (!f_i_v__ref_check()) { return 3;}
  if (!f_i_v__check()) { return 4;}
  if (!f__v_i_ref_check()) { return 5;}
  if (!f__v_i_check()) { return 6;}
  if (!f_idd_v_idid_ref_check()) { return 7;}
  if (!f_idd_v_idid_check()) { return 8;}
  return 0;
}


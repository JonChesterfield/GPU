#!/usr/bin/env lua

local inspect = require("inspect")

local template = [[

STRUCT_TYPE

template <typename A>
NOINLINE FORCEINLINE A CASE_middle(FIXEDPARAMETER$...)
{
  va_list va;
  __builtin_va_start(va, 0);VA_ARG_PREFIX
  A x = va_arg(va, A);
  va_end(va);
  return x;
}

template <typename A>
NOINLINE FORCEINLINE A CASE_ref_middle(FIXEDPARAMETER$va_list buffer)
{
  va_list va;
  __builtin_va_copy(va, buffer);VA_ARG_PREFIX
  A x = va_arg(va, A);
  va_end(va);
  return x;
}

template <typename A>
NOINLINE FORCEINLINE A CASE_outer(A x)
{
  A tmp = CASE_middle<A>(FIXEDARGUMENT$VARARGPARAMETER$x);
  return tmp;
}

template <typename A>
NOINLINE FORCEINLINE A CASE_ref_outer(A x)
{
BUFFER_VALIST
  va_list ptr;
  init_valist((void*)&buffer, &ptr);
  A tmp = CASE_ref_middle<A>(FIXEDARGUMENT$ptr);
  return tmp;
}


NOINLINE FORCEINLINE bool CASE_check(void)
{
  using T = TARGET_TYPE;
  T x = TARGET_INIT;
  T y = CASE_outer<T>(x);
  return x == y;
}

NOINLINE FORCEINLINE bool CASE_ref_check(void)
{
  using T = TARGET_TYPE;
  T x = TARGET_INIT;
  T y = CASE_ref_outer<T>(x);
  return x == y;
}


]]


-- Got zero or more normal arguments
-- Then zero or more variadic arguments
-- Then the focus of interest
-- Then zero or more following variadic arguments
-- Each of the variadic ones needs to know its type

function int(x)
   return {val = x, ty = "int", z = "0"}
end

function double(x)
   return {val = x, ty = "double", z = "0.0"}
end

-- print(inspect( {int("42"), double("4.13"),}))

abbrev_to_type = {
   ["i"] = "int",
   ["f"] = "float",
   ["d"] = "double",
   ["s_ii"] = "tup<int,int>",
   ["s_if"] = "tup<int,float>",
   ["s_id"] = "tup<int,double>",
}
type_to_zero = {
   ["int"] = "0",
   ["float"] = "0.0f",
   ["double"] = "0.0",
   ["s_ii"] = "{0, 0}",
   ["s_if"] = "{0, 0.0f}",
   ["s_id"] = "{0, 0.0}",
}
type_to_size = {
   ["int"] = "4",
   ["float"] = "4",
   ["double"] = "8",
   ["tup<int,int>"] = "8",
   ["tup<int,float>"] = "8",
   ["tup<int,double>"] = "16",
}

local accumulate = {}

function struct_of_types_aligned(types, slot_align)
   local offset = 0
   local type_def = string.format([[
#if SLOT_ALIGN == %s
struct __attribute__((packed)) CASE_buffer 
{]], slot_align)
   local j = 0
   
  for i, ty in ipairs(types) do
     assert(ty ~= nil)
     local sz = type_to_size[ty]
     assert(sz ~= nil)

     if (offset % slot_align) ~= 0 then
        local rem = offset % slot_align
        local pad = slot_align - rem
        type_def = string.format("%s\n  char pad%s[%s];", type_def, j, pad)
        j = j + 1
        offset = offset + pad
     end

     local name = string.format("x%s", i-1)
     if i == #types then
        name = "val"
     end
     type_def = string.format("%s\n  %s %s;", type_def, ty, name)
     offset = offset + sz
  end

  type_def = type_def .. [[

};
#endif
]]

   return type_def
end

function struct_of_types(types)
   if #types == 1 then
      return string.format([[
struct __attribute__((packed)) CASE_buffer 
{
  %s val;
};
]], types[1])      
   end

   
   return struct_of_types_aligned(types, 8) .. struct_of_types_aligned(types, 4)
   
end


function instantiate(fixed_types,
                     vararg_types,
                     target_pair)

   local case_name = 'f_'

   local fixed_param = ''
   local fixed_param_init = ''

   local vararg_prefix = ''
   local vararg_prefix_init = ''

   assert(#target_pair == 2)
   
   for i, f in ipairs(fixed_types) do
      local ty = abbrev_to_type[f]
      assert(ty ~= nil)
      fixed_param = string.format("%s%s x%d, ", fixed_param, ty, i-1)
      case_name = case_name .. f
      local z = type_to_zero[ty]
      if z == nil then z = string.format("{/*%s*/}", ty) end
      fixed_param_init = string.format("%s%s, ", fixed_param_init, z)
   end

   case_name = case_name .. '_v_'
   
   for i, f in ipairs(vararg_types) do
      local ty = abbrev_to_type[f]
      assert(ty ~= nil)

      case_name = case_name .. f
      local z = type_to_zero[ty]
      if z == nil then z = string.format("%s{}", ty) end
      vararg_prefix_init = string.format("%s%s, ", vararg_prefix_init, z)
   end

   local valist_arg_prefix = ''
   for i, f in ipairs(vararg_types) do
      local ty = abbrev_to_type[f]
      assert(ty ~= nil)
      valist_arg_prefix = string.format([[%s
  {
    using T = %s;
    va_arg(va, T);
  }
]], valist_arg_prefix, ty)
   end

   local type_def = ''
   do
      local tmp = {}
      for i, f in ipairs(vararg_types) do
         tmp[i] = abbrev_to_type[f]
      end
      tmp[#tmp+1] = abbrev_to_type[target_pair[1]]
      type_def = struct_of_types(tmp)
   end
   type_def = type_def:gsub("CASE", case_name)   

   local type_inst = [[
  CASE_buffer buffer = {]]

   for i, f in ipairs(vararg_types) do
      local ty = abbrev_to_type[f]
      assert(ty ~= nil)
      local z = type_to_zero[ty]
      if z == nil then z = string.format("{/*%s*/}", ty) end
      type_inst = string.format("%s\n    .x%s = %s,", type_inst, i-1, z)
   end
   type_inst = string.format("%s\n    .val = %s,", type_inst, "x")


   type_inst = type_inst:gsub("CASE", case_name)
   type_inst = type_inst .. '\n  };'
   
   local t = template
   t = t:gsub("FIXEDPARAMETER", fixed_param)
   t = t:gsub("FIXEDARGUMENT", fixed_param_init)

   t = t:gsub("VARARGPARAMETER", vararg_prefix_init)
   t = t:gsub("TARGET_TYPE", abbrev_to_type[target_pair[1]])
   t = t:gsub("TARGET_INIT", target_pair[2])
   
   t = t:gsub("%$","")

   t = t:gsub("STRUCT_TYPE", type_def)
   t = t:gsub("BUFFER_VALIST", type_inst)

   t = t:gsub("VA_ARG_PREFIX", valist_arg_prefix)
   
   t = t:gsub("CASE", case_name)
   accumulate[#accumulate+1] = case_name .. "_ref_check"
   accumulate[#accumulate+1] = case_name .. "_check"

return t
end


function header()
      return [[
typedef __builtin_va_list va_list;
#define va_copy(dest, src) __builtin_va_copy(dest, src)
#define va_start(ap, ...) __builtin_va_start(ap, 0)
#define va_end(ap) __builtin_va_end(ap)
#define va_arg(ap, type) __builtin_va_arg(ap, type)
#define NOINLINE  __attribute__((noinline))
#define FORCEINLINE  //__attribute__((always_inline))

template <typename T0, typename T1>
struct tup
{
 T0 x0;
 T1 x1;
};

template <typename T0, typename T1>
static bool operator==(tup<T0, T1> const& lhs, tup<T0, T1> const& rhs)
{
  return lhs.x0 == rhs.x0 & lhs.x1 == rhs.x1;
}

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
  *out = (char*)BUFFER;
}
#endif



]]
end

function footer()
   local r = [[
extern "C"
int main()
{]]

for idx, a in ipairs(accumulate) do
   r = string.format([[%s
  if (!%s()) { return %s;}]], r, a, idx)

end

r = r .. [[

  return 0;
}
]]
return r
end


function body()
   local r = ''

   r = r ..
      instantiate(
         {},
         {},
         {"i", "42"})  

   r = r ..
      instantiate(
         {"i",  },
         {},
         {"i", "21"})

   r = r ..
      instantiate(
         {},
         {"i"},
         {"i", "101"})   
   
   r = r ..
      instantiate(
         {"i", "d", "d", },
         {"i", "d", "i", "d"},
         {"i", "42"})

   -- tup<int,double> is passed as an int and a double, separate arguments
   r = r ..
      instantiate(
         {"i",},
         {"s_id",},
         {"s_id", "{11, 3.14}",})

   -- tup<int,int> is passed as [2 x i32]
   r = r ..
      instantiate(
         {"i",},
         {"s_ii",},
         {"s_ii", "{11, 12}",})

-- tup<int,float> is passed as [2 x i32] so that's really fun
-- in combination with the float->double promotion varargs usually do
   r = r ..
      instantiate(
         {"i",},
         {"s_if",},
         {"s_if", "{31, 3.14f}",})


   
   return r
end

print(header() .. body() .. footer())





#!/usr/bin/env lua

local r = [[

#ifndef EMIT_UNDEF_SYMBOLS
#define EMIT_UNDEF_SYMBOLS 0
#endif

#ifndef EMIT_MAIN_SYMBOL
#define EMIT_MAIN_SYMBOL 1
#endif

#ifndef EMIT_VARIADIC_SYMBOLS
#define EMIT_VARIADIC_SYMBOLS 1
#endif

#ifndef EMIT_VALIST_SYMBOLS
#define EMIT_VALIST_SYMBOLS 1
#endif

#include "varargs_pairs.hpp"


#define GET_FIRST_SECOND_ATTRIBUTE  __attribute__((used))

]]

local main = [[
#if EMIT_MAIN_SYMBOL
extern "C" int main()
{
]]


local template = [[

#if EMIT_VARIADIC_SYMBOLS
GET_FIRST_SECOND_ATTRIBUTE
LHSType variadic_NAME_get_first(...)
{
  va_list va;
  __builtin_va_start(va, 0);
  using T = LHSType;
  T r = va_arg(va, T);
  va_end(va);
  return r;
}

GET_FIRST_SECOND_ATTRIBUTE
RHSType variadic_NAME_get_second(...)
{
  va_list va;
  __builtin_va_start(va, 0);
  using T = LHSType;
  va_arg(va, T);
  using U = RHSType;
  U r = va_arg(va, U);
  va_end(va);
  return r;
}
#endif

#if EMIT_VALIST_SYMBOLS
GET_FIRST_SECOND_ATTRIBUTE
LHSType valist_NAME_get_first(va_list varargs)
{
  using T = LHSType;
  return va_arg(varargs, T);
}


GET_FIRST_SECOND_ATTRIBUTE
RHSType valist_NAME_get_second(va_list varargs)
{
  using T = LHSType;
  va_arg(varargs, T);
  using U = RHSType;
  return va_arg(varargs, U);
}
#endif


#if EMIT_UNDEF_SYMBOLS
#if EMIT_VALIST_SYMBOLS
void valist_NAME_target(va_list);

__attribute__((used))
void valist_NAME_call(LHSType x, RHSType y)
{
  using X = LHSType;
  using Y = RHSType;
  constexpr unsigned P = get_pad<X,Y>();
  buffer_type<X, Y, P> buffer (x, y);

  va_list varargs;
  init_valist((void*)&buffer, &varargs);

  valist_NAME_target(varargs);

  va_end(varargs);
}
#endif

#if EMIT_VARIADIC_SYMBOLS
void variadic_NAME_target(...);

__attribute__((used))
void variadic_NAME_call(LHSType x, RHSType y)
{
  variadic_NAME_target(x, y);
}
#endif
#endif

]]

-- vector types currently failing on x64, might be related to -mavx
local types = {'int', 'long', 'double', 'libcS',  } -- '__m128', '__m256',}
local non_promoted_types = {'char', 'short', 'float'}

-- reduce number of generated cases
local disable_pairs = false
-- types = {'int', 'double', }


non_promoted_types = {}


local typenames = {}
for _,i in ipairs(types) do
   typenames[i] = i
end
for _,i in ipairs(non_promoted_types) do
   typenames[i] = i
end

typenames['__m128'] ='m128'
typenames['__m256'] ='m256'


local types_to_gen_pairs_from = {}

do
   for _,i in ipairs(types) do
      types_to_gen_pairs_from[#types_to_gen_pairs_from+1] = i
   end
   for _,i in ipairs(non_promoted_types) do
      types_to_gen_pairs_from[#types_to_gen_pairs_from+1] = i
   end
end

do
   local r = {}
   for _,i in ipairs(types) do
      r[#r+1] = i
   end
   
   for _,i in ipairs(types_to_gen_pairs_from) do
      if not disable_pairs then
         for _,j in ipairs(types_to_gen_pairs_from) do
            local k = string.format('pair<%s,%s>',i,j)
            r[#r+1] = k           
            typenames[k] = string.format('pair_%s_%s',typenames[i],typenames[j])
         end
      end
   end
   types = r
end

-- types = {'libcS'}

local count = 0

for _,i in ipairs(types) do
   for _,j in ipairs(types) do

      local name = string.format([[%s_%s]],typenames[i], typenames[j])

      local t = template
      t = t:gsub("NAME", name)
      t = t:gsub("LHSType", i)
      t = t:gsub("RHSType", j)

      t = t:gsub("LHSTypeName", typenames[i])
      t = t:gsub("RHSTypeName", typenames[j])


      
      r = r .. t
      
      count = count + 1
      main = main .. string.format([[
  if (!check_va_arg<%s, %s>()) {
    return %s;
  }

]], i, j, count)

      count = count + 1
      main = main .. string.format([[
  if (!variadic_check_va_arg<%s, %s>()) {
    return %s;
  }

]], i, j, count)
      
   end
end
   
main = main .. [[
  return 0;
}
#endif
]]


r = r .. main
print(r)

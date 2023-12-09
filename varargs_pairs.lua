local r = [[

#define UNDEF_SYMBOL_OK 0
#include "varargs_pairs.hpp"


#define GET_FIRST_SECOND_ATTRIBUTE static __attribute__((unused))

]]

local main = [[
extern "C" int main()
{
]]


local template = [[

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
LHSType valist_NAME_get_first(va_list va)
{
  using T = LHSType;
  return va_arg(va, T);
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

GET_FIRST_SECOND_ATTRIBUTE
RHSType valist_NAME_get_second(va_list va)
{
  using T = LHSType;
  va_arg(va, T);
  using U = RHSType;
  return va_arg(va, U);
}


#if UNDEF_SYMBOL_OK
void variadic_NAME_target(...);
void valist_NAME_target(va_list);

__attribute__((used))
void variadic_NAME_call(LHSType x, RHSType y)
{
  variadic_NAME_target(x, y);
}

__attribute__((used))
void valist_NAME_call(LHSType x, RHSType y)
{
  using X = LHSType;
  using Y = RHSType;
  constexpr unsigned P = get_pad<X,Y>();
  buffer_type<X, Y, P> buffer = {.x = x, .y = y};

  va_list va;
  init_valist((void*)&buffer, &va);

  valist_NAME_target(va);

  va_end(va);
}
#endif


]]

local types = {'int', 'long', 'double', '__m128', '__m256', 'libcS',}
local non_promoted_types = {'char', 'short', 'float'}

local typenames = {}
for _,i in ipairs(types) do
   typenames[i] = i
end
for _,i in ipairs(non_promoted_types) do
   typenames[i] = i
end

typenames['__m128'] ='m128'
typenames['__m256'] ='m256'

do
   local r = {}
   local iter = {}
   for _,i in ipairs(types) do
      iter[#iter+1] = i
   end
      for _,i in ipairs(non_promoted_types) do
      iter[#iter+1] = i
   end
   
      for _,i in ipairs(iter) do
         r[#r+1] = i
         for _,j in ipairs(iter) do
            local k = string.format('pair<%s,%s>',i,j)
            r[#r+1] = k           
            typenames[k] = string.format('pair_%s_%s',typenames[i],typenames[j])
         end
      end
      types = r
end

local count = 0

for _,i in ipairs(types) do
   for _,j in ipairs(types) do
      count = count + 1

      local name = string.format([[%s_%s]],typenames[i], typenames[j])

      local t = template
      t = t:gsub("NAME", name)
      t = t:gsub("LHSType", i)
      t = t:gsub("RHSType", j)

      t = t:gsub("LHSTypeName", typenames[i])
      t = t:gsub("RHSTypeName", typenames[j])


      
      r = r .. t
      
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
]]


r = r .. main
print(r)

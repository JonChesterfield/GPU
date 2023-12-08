local r = [[
#include "varargs_pairs.hpp"

]]

local main = [[
extern "C" int main()
{
]]


local template = [[

__attribute__((used))
LHSType variadic_NAME_get_first(...)
{
  va_list va;
  __builtin_va_start(va, 0);
  using T = LHSType;
  T r = va_arg(va, T);
  va_end(va);
  return r;
}

__attribute__((used))
LHSType valist_NAME_get_first(va_list va)
{
  using T = LHSType;
  return va_arg(va, T);
}

__attribute__((used))
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

__attribute__((used))
RHSType valist_NAME_get_second(va_list va)
{
  using T = LHSType;
  va_arg(va, T);
  using U = RHSType;
  return va_arg(va, U);
}


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


]]

local types = {'int', 'long', 'double', '__m128', '__m256',}

local typenames = {}
for _,i in ipairs(types) do
   typenames[i] = i
end

typenames['__m128'] ='m128'
typenames['__m256'] ='m256'

do
   local r = {}
   for _,i in ipairs(types) do
      for _,j in ipairs(types) do
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
  if (!check_va_arg<%s, %s>()) {
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

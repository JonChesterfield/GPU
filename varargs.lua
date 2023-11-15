#!/usr/bin/env lua

local inspect = require("inspect")

local template = [[
template <typename A>
NOINLINE A CASE_middle(FIXEDPARAMETER$...)
{
  va_list va;
  __builtin_va_start(va, 0);
  A x = va_arg(va, A);
  va_end(va);
  return x;
}

template <typename A>
NOINLINE A CASE_outer(A x)
{
  A tmp = CASE_middle<A>(FIXEDARGUMENT$VARARGPARAMETER$x);
  return tmp;
}

NOINLINE bool CASE_check(void)
{
  using T = TARGET_TYPE;
  T x = TARGET_INIT;
  T y = CASE_outer<T>(x);
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
}
type_to_zero = {
   ["int"] = "0",
   ["float"] = "0.0f",
   ["double"] = "0.0",
}


local accumulate = {}

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
      if z == nil then z = string.format("{/*%s*/}", ty) end
      vararg_prefix_init = string.format("%s%s, ", vararg_prefix_init, z)

   end
   
   local t = template
   t = t:gsub("FIXEDPARAMETER", fixed_param)
   t = t:gsub("FIXEDARGUMENT", fixed_param_init)

   t = t:gsub("VARARGPARAMETER", vararg_prefix_init)
   t = t:gsub("TARGET_TYPE", abbrev_to_type[target_pair[1]])
   t = t:gsub("TARGET_INIT", target_pair[2])
   
   t = t:gsub("%$","")

   t = t:gsub("CASE", case_name)

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
#define NOINLINE // __attribute__((noinline))

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
         {"i", "f", "d", },
         {"f", "f"},
         {"i", "42"})
   
   return r
end

print(header() .. body() .. footer())





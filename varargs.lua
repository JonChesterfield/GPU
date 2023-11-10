local inspect = require("inspect")

local template = [[
template <typename A>
A middle(...)
{
  va_list va;
 __builtin_va_start(va, 0);
  A x = va_arg(va, A);
  va_end(va);
  return x;
}

template <typename R>
R outer(R x)
{
  R tmp = middle<R>(x);
  return tmp;
}


template <typename R>
bool check(R x)
{
  R y = outer<R>(x);
  return x == y;
}

]]


-- Got zero or more normal arguments
-- Then zero or more variadic arguments
-- Then the focus of interest
-- Then zero or more following variadic arguments
-- Each of the variadic ones needs to know its type

function int(x)
   return {val = x, ty = "int"}
end

function double(x)
   return {val = x, ty = "double"}
end

print(inspect( {int("42"), double("4.13"),}))

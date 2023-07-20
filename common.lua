inspect = require("inspect")
lfs = require("lfs")

if false then
   print(inspect(arg))
   print(string.format("arg[0] = %s", arg[1]))
   print(string.format("arg[1] = %s", arg[2]))
end

assert(arg[1])
assert(arg[2])

local lhs = assert(io.open(arg[1], "r"))
local rhs = assert(io.open(arg[2], "r"))

local count = 0

while true do
   local l = lhs:read("*line")
   local r = rhs:read("*line")
   if l == r then
      count = count + 1
   else
      break
   end
end

if count > 5 then
   count = count - 5
end

print(count)


lhs:close()
rhs:close()

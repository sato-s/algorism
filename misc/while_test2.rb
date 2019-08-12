max = 0
value = 0
r = 2

while value <= 1025
  max += 1
  value = 2 ** max
end

p max

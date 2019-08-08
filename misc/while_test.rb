require 'pry'
i = 0
j = 4

while i < j
  puts "#{i}, #{j}"
  i += 1
  j -= 1
end

def special?(chars, from, to)
  first = chars.first
  while from < to
    unless chars[from] == first && chars[to] == first
      # binding.pry
      return false
    end
    from += 1
    to -= 1
  end 
  true
end

input = "cccac"
puts special?(input.chars, 0, input.size - 1)

string1 = 'uniq'
string2 = 'aabb'

def unique?(str)
  # Imeadiatry return false
  return false if str.size > 128
  # We need 128 size array, because ascii has 128 chars
  array = Array.new(128)
  str.chars.map(&:bytes).map(&:first).each do |char|
    return false if array[char]
    array[char] = true
  end
  true
end

puts unique?(string1)
puts unique?(string2)


# The time complexity for this code isO(n), where n is the length of the string. The space complexity is 0( 1),
# (You could also argue the time complexity is 0 ( 1 ) , since the for loop will never iterate through more than
# 128 characters.) If you didn't want to assume the character set is fixed, you could express the complexity as
# 0 ( c ) spaceand 0 ( m i n ( C j n ) ) or 0 ( c ) time, where c is the size of the character set.

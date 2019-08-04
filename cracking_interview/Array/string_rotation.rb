# String Rotation; Assume you have a method i s S u b s t r i n g which checks if one word is a substring
# of another. Given two strings, si and s2, write code to check if s2 is a rotation of si using only one
# call to i s S u b s t r i n g [e.g., " w a t e r b o t t l e " is a rotation o P ' e r b o t t l e w a t " ) ,
# Hints: #34, #88,#W4
# p'j 206

s1 = 'watterbottle'
s2 = 'terbottlewat'
# def substring?(s1, s2)
#   return false if s1.size != s2.size
#   s1.size.times do |i|
#     head = s1[0..i]
#     rest = s1[(i+1)..s1.size]
#     head2 = s2[-head.size..-1]
#     rest2 = s2[0...(-head.size)]
#     return true if head == head2 and rest == rest2
#   end
#   false
# end


# Better
def substring?(s1, s2)
  return false if s1.size != s2.size
  s1.size.times do |i|
    head = s1[0..i]
    rest = s1[(i+1)..s1.size]

    return true if (rest + head) == s2
  end
  false
end

p substring?(s1, s2)

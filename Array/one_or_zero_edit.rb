# One Away: There are three types of edits that can be performed on strings: insert a character,
# remove a character, or replace a character. Given two strings, write a function to check if they are
# one edit (or zero edits) away.
#
def one_edit?(s1, s2)
  if s1.size == s2.size
    one_edit_replace?(s1, s2)
  elsif s1.size + 1 == s2.size
    one_edit_insert?(s2, s1)
  elsif s1.size - 1 == s2.size
    one_edit_insert?(s1, s2)
  else
    false
  end
end

def one_edit_replace?(s1, s2)
  diffrence_found = false
  s1.size.times do |i|
    if s1[i] != s2[i]
      return false if diffrence_found
      diffrence_found = true
    end
  end
  true
end

def one_edit_insert?(longer, shorter)
  i = 0
  j = 0
  diffrence_found = false
  while(i < longer.size && j < shorter.size) do
    if longer[i] != shorter[j]
      return false if diffrence_found
      diffrence_found = true
      i +=1
    else
      i +=1
      j +=1
    end
  end
  true
end

puts one_edit?('abc', 'aebc')

string1 = 'abc'
string2 = 'bac'
string3 = 'baa'

def make_char_set(s)
  char_set = Array.new(128, 0)
  s.chars.map(&:bytes).map(&:first).each do |c|
    char_set[c] += 1
  end
  char_set
end

# My answer
def permulation1?(s1, s2)
  char_set1 = make_char_set(s1)
  char_set2 = make_char_set(s2)
  char_set1 == char_set2
end

# Using sort. (Not cost effective)
def permulation2?(s1, s2)
  s1.charts.sort == s2.chars.sort
end

# Optimal
def permulation3?(s1, s2)
  return false if s1.size != s2.size
  char_set = make_char_set(s1)
  # In permulation1?, i used two array.
  # But actually we only need one array.
  # Just count down first array
  s2.chars.map(&:bytes).map(&:first).each do |c|
    char_set[c] -= 1
    # we can check all array element is 0 after iteration
    # But we can return false if we found minus value
    # This is more coset effective way
    return false if char_set[c] < 0
  end
  true
end


puts permulation3?(string1, string2)
puts permulation3?(string1, string3)

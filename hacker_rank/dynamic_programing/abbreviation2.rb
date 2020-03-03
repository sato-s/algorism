require 'pry'
# You can perform the following operations on the string, :
#
# Capitalize zero or more of a's lowercase letters.
# Delete all of the remaining lowercase letters in a.
# Given two strings,  a and b, determine if it's possible to make  equal to  as described. If so, print YES on a new line. Otherwise, print NO.
#
class String

  def upcase?
    self == upcase
  end

  def downcase?
    !upcase?
  end

end


def abbrreviation(s1, s2)
  s1 = s1.chars
  s2 = s2.chars
  memo = Array.new(s1.size + 1) { Array.new(s2.size + 1) }

  memo[0][0] = true
  (1..s1.size).each do |i|
    memo[i][0] = s1.take(i).all?(&:downcase?)
  end

  (1..s2.size).each do |i|
    memo[0][i] = false
  end

  (1..s1.size).each do |i|
    (1..s2.size).each do |j|
      c1 = s1[i-1]
      c2 = s2[j-1]
      if c1 == c2
        memo[i][j] = memo[i-1][j-1]
      elsif c1.downcase? && c1.upcase == c2
        memo[i][j] = memo[i-1][j-1] || memo[i-1][j]
      elsif c1.downcase?
        memo[i][j] = memo[i-1][j]
      elsif c1.upcase?
        memo[i][j] = false
      else
        raise 'som'
      end

    end
  end

  if memo.last.last
    'YES'
  else
    'NO'
  end

end

a = "aBbdD"
b = "BBD"
p abbrreviation(a, b)

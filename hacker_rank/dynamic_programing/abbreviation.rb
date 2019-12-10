# You can perform the following operations on the string, a:
#
# Capitalize zero or more of a's lowercase letters.
# Delete all of the remaining lowercase letters in a.
# Given two strings,  a and b, determine if it's possible to make  equal to  as described. If so, print YES on a new line. Otherwise, print NO.
#
# Sample Input
#
# 1
# daBcd
# ABC
# Sample Output
#
# YES
# Explanation
#
# image
#
# We have  daBcd and  ABC. We perform the following operation:
#
# Capitalize the letters a and c in  so that  dABCd.
# Delete all the remaining lowercase letters in  so that  ABC.
# Because we were able to successfully convert  to , we print YES on a new line.
#
require 'pry'

def possible?(s1, s2)
  s1 = s1.chars
  s2 = s2.chars
  memo = Array.new(s1.size + 1) { Array.new(s2.size + 1) }
  su1 = []
  count = 0
  s1.map{|s| !!(s.match /[A-Z]/) }.each do |is_upper_case|
    if is_upper_case
      count += 1
    end
    su1 << count
  end

  (0..(s1.size)).each do |i|
    memo[i][0] = (su1[i] == 0)
  end

  (0..(s2.size)).each do |j|
    memo[0][j] = (j == 0)
  end

  (0..(s1.size)).each do |i|
    (0..(s2.size)).each do |j|
      if s1[i].upcase == s2[j]
        memo[i][j] = memo[i-1][j-1]
      else
        if s1[i].match(/[A-Z]/)
          # upcase
        else
        end
      end
    end
  end

  binding.pry

end

possible?('daBcd', 'ABC')

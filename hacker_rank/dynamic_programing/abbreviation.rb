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
#
#
#A simple DP approach works. For example, a = "aBbdD" b = "BBD" since the last character in a is upper case and last character in b is also upper case and both are equal, f(a,b) = f("aBbd","BB")
#
# Now d can never be made equal to B therfore- f("aBbd","BB") = f("aBb","BB")
#
# Now b can be capitalized to B,therfore we have two options - either capitalize b to B or dont capitalize b. f("aBb","BB") = f("aB","B") or f("aB","BB") #Note that this is the 'or' operator. f is a boolean value.
#
# if we have something like a = 'C' and b = 'D' then f(a,b) evaluates to False (boolean value).
#
# Lastly (for initialization of the dp array)-
# if a is non-empty and b is empty, then f(a,b) is True only if all the characters in a are lower case.
# if a is empty and b is non-empty, then f(a,b) is always False.
# if both are empty then f(a,b) = True
#
# Good Luck !!
require 'pry'

def possible?(s1, s2)
  s1 = s1.chars
  s2 = s2.chars
  memo = Array.new(s1.size + 1) { Array.new(s2.size + 1) }
  memo[0][0] = true
  (1..(s1.size)).each do |i|
    memo[i][0] = s1[0...i].count{|c| c.match(/[A-Z]/)} == 0
  end
  (1..(s2.size)).each do |j|
    memo[0][j] = false
  end
  (1..(s1.size)).each do |i|
    (1..(s2.size)).each do |j|
      c1 = s1[i-1]
      c2 = s2[j-1]
      if c1 == c2
        memo[i][j] = memo[i-1][j-1]
      else
        if c1.upcase == c2
          memo[i][j] = memo[i-1][j] || memo[i-1][j-1]
        else
          if c1.match(/[A-Z]/)
            memo[i][j] = false
          else
            memo[i][j] = memo[i-1][j]
          end
        end
      end
    end
  end
  if memo.last.last
    'YES'
  else
    'NO'
  end

end
# p possible?('C', 'D')
# p possible?('daBcd', 'ABC')
# p possible?('UMKFW', 'UMKFW')
# p possible?('beFgH', 'EFG')

# p possible?('XXVVnDEFYgYeMXzWINQYHAQKKOZEYgSRCzLZAmUYGUGILjMDET', 'XXVVDEFYYMXWINQYHAQKKOZEYSRCLZAUYGUGILMDETQVWU')
# p possible?('PVJSNVBDXABZYYGIGFYDICWTFUEJMDXADhqcbzva', 'PVJSNVBDXABZYYGIGFYDICWTFUEJMDXAD')
# p possible?('QOTLYiFECLAGIEWRQMWPSMWIOQSEBEOAuhuvo', 'QOTLYFECLAGIEWRQMWPSMWIOQSEBEOA')
# p possible?('DRFNLZZVHLPZWIupjwdmqafmgkg', 'DRFNLZZVHLPZWI')
# p possible?('SLIHGCUOXOPQYUNEPSYVDaEZKNEYZJUHFXUIL', 'SLIHCUOXOPQYNPSYVDEZKEZJUHFXUIHMGFP')
# p possible?('RYASPJNZEFHEORROXWZFOVDWQCFGRZLWWXJVMTLGGnscruaa', 'RYASPJNZEFHEORROXWZFOVDWQCFGRZLWWXJVMTLGG')
# p possible?('AVECtLVOXKPHIViTZViLKZCZAXZUZRYZDSTIHuCKNykdduywb', 'AVECLVOXKPHIVTZVLKZCZAXZUZRYZDSTIHCKN')
p possible?('wZPRSZwGIMUAKONSVAUBUgSVPBWRSTJZECxMTQXXA', 'ZPRSZGIMUAKONSVAUBUSVPBWRSTJZECMTQXXA')
# p possible?('SYIHDDSMREKXOKRFDQAOZJQXRIDWXPYINFZCEFYyxu', 'SYIHDDSMREKXOKRFDQAOZJQXRIDWXPYINFZCEFY')
# p possible?('EIZGAWWDCSJBBZPBYVNKRDEWVZnSSWZIw', 'EIZGAWWDCSJBBZPBYVNKRDEWVZSSWZI')
# class String
#   def upcase?
#     self.upcase == self
#   end
# end
#
# def possible?(s1, s2)
#   s1 = s1.chars
#   s2 = s2.chars
#   memo = Array.new(s1.size + 1) { Array.new(s2.size + 1) }
#   # i think this is like LCS
#   (0..(s1.size)).each do |i|
#     memo[i][0] = {c: 0, seq: Array.new}
#   end
#   (0..(s2.size)).each do |j|
#     memo[0][j] = {c: 0, seq: Array.new}
#   end
#   (1..(s1.size)).each do |i|
#     (1..(s2.size)).each do |j|
#       if s1[i-1].upcase == s2[j-1]
#         memo[i][j] = {c: memo[i-1][j-1][:c]+1, seq: memo[i-1][j-1][:seq] + [i-1]}
#       else
#         if memo[i-1][j][:c] > memo[i][j-1][:c]
#           memo[i][j] = memo[i-1][j]
#         else
#           memo[i][j] = memo[i][j - 1]
#         end
#       end
#     end
#   end
#   t = memo.last.last
#   if t[:c] != s2.size
#     return 'NO'
#   end
#   t[:seq].each do |i|
#     if s1[i].match(/[A-Z]/)
#       return 'NO'
#     end
#   end
#   return 'YES'
# end
#
# # Longest common subsequences
# def lcs(s1, s2)
#   s1 = s1.chars
#   s2 = s2.chars
#   memo = Array.new(s1.size + 1) { Array.new(s2.size + 1) }
#   # i think this is like LCS
#   (0..(s1.size)).each do |i|
#     memo[i][0] = 0
#   end
#   (0..(s2.size)).each do |j|
#     memo[0][j] = 0
#   end
#   (1..(s1.size)).each do |i|
#     (1..(s2.size)).each do |j|
#       if s1[i-1].upcase == s2[j-1]
#         memo[i][j] = memo[i-1][j-1] + 1
#       else
#         memo[i][j] = [memo[i-1][j], memo[i][j-1]].max
#       end
#     end
#   end
# end
#
# p lcs('daBcd', 'ABC')
# p possible?('daBcd', 'ABC')
# p possible?('UMKFW', 'UMKFW')
# p possible?('beFgH', 'EFG')
# p lcs('dabcdx', 'ABCX')

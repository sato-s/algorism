# 逆さ言葉の順列
# 対象の文字列が、何らかの逆さ言葉の順列であることを判定する。
# Ex:
# input: tactcoa
# output: true (acttca)

string1 = 'tactcoa'
string2 = 'tactcoaa'

def palindrome_permutation?(string)
  letters = Array.new(128, true)
  string
    .chars
    .map(&:bytes)
    .map(&:first)
    .each do |c|
      letters[c] = !letters[c]
    end
  letters.all? || letters.select{|letter| !letter}.size == 1
end

puts palindrome_permutation?(string1)
puts palindrome_permutation?(string2)

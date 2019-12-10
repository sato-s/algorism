require 'pry'

def edit_distance(s1, s2)
  s1 = s1.chars
  s2 = s2.chars
  memo = Array.new(s1.size + 1){ Array.new(s2.size + 1) }
  (0..(s1.size)).each do |i|
    (0..(s2.size)).each do |j|
      if i.zero?
        memo[i][j] = j
      elsif j.zero?
        memo[i][j] = i
      else
        if s1[i] != s2[j]
          memo[i][j] = [memo[i-1][j] + 1, memo[i][j-1] + 1, memo[i-1][j-1] + 1].min
        else
          memo[i][j] = memo[i-1][j-1]
        end
      end
    end
  end
  # binding.pry
  p memo.last.last
  # p memo
end

edit_distance("algorithm", "altruistic")
edit_distance("saturday", "sunday")

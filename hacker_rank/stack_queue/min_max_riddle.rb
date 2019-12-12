# Given an integer array of size n, find the maximum of the minimum(s) of every window size in the array. The window size varies from 1 to n.
#
# For example, given [6, 3, 5, 1, 2]
#
# Sample Input 0
#
# 4
# 2 6 1 12
# Sample Output 0
#
# 12 2 1 1
require 'pry'
arr = [2, 6, 1, 3, 2, 0]

def riddle(arr)
  stack = []
  hash = {}
  (0...(arr.size)).each do |i|
    if i == 0
      stack << i
    elsif arr[i-1] <= arr[i]
      stack << i
    else
      count = 1
      v = -1000
      while !stack.empty?
        do
        j = stack.last
        if arr[j] < arr[i]
          break;
        end
        # j = stack.pop
        # v = arr[j]
        # hash[v] = count
        # count += 1
      end
      stack << i
    end
  end

  count = 1
  until stack.empty? do
    v = stack.pop
    hash[v] = count
    count += 1
  end

  # Calc summary
  summary = []
  (1..(arr.size)).each do |i|
    candidates = []
    hash.each_pair do |k,v|
      if v == i
        candidates << k
      end
    end
    unless candidates.empty?
      summary << candidates.max
    else
      summary << summary[i - 1]
    end
  end
  binding.pry
end

p riddle(arr)


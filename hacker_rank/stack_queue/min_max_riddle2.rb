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
arr = %w[1 2 3 6 5 1 13 3].map(&:to_i)


def riddle(arr)
  min_windows = Array.new(arr.size, 1)
  left = Array.new(arr.size, -1)
  right = Array.new(arr.size, arr.size)

  stack = []

  (0...(arr.size)).each do |i|
    while !stack.empty? && arr[stack.last] > arr[i]
      stack.pop
    end
    unless stack.empty?
      left[i] = stack.last
    end
    stack << i
  end

  stack = []
  (0...(arr.size)).reverse_each do |i|
    while !stack.empty? && arr[stack.last] > arr[i]
      stack.pop
    end
    unless stack.empty?
      right[i] = stack.last
    end
    stack << i
  end


  # wip
  p min_windows
  p left
  p right
end

riddle(arr)

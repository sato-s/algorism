# Given an integer array of size n, find the maximum of the minimum(s) of every window size in the array. The window size varies from 1 to n.
#
# For example, given [6, 3, 5, 1, 2]
#
# Sample Input 0
#
# 4
# 2 6 1 12
# 2 1 4 1
# Sample Output 0
#
# 12 2 1 1
require 'pry'
# arr = %w[2 6 1 12].map(&:to_i)

arr = %w[1 2 3 6 5 1 13 3].map(&:to_i)
arr = %w[789168277 694294362 532144299 20472621 316665904 59654039 685958445 925819184 371690486 285650353 522515445 624800694 396417773 467681822 964079876 355847868 424895284 50621903 728094833 535436067 221600465 832169804 641711594 518285605 235027997 904664230 223080251 337085579 5125280 448775176 831453463 550142629 822686012 555190916 911857735 144603739 751265137 274554418 450666269 984349810 716998518 949717950 313190920 600769443 140712186 218387168 416515873 194487510 149671312 241556542 575727819 873823206].map(&:to_i)

def riddle(arr)
  # How much width this element can be minimum
  min_windows = Array.new(arr.size, 1)
  left = Array.new(arr.size, -1)
  right = Array.new(arr.size, arr.size)

  stack = []
  (0...(arr.size)).each do |i|
    while !stack.empty? && arr[stack.last] >= arr[i]
      stack.pop
    end
    if !stack.empty?
      left[i] = stack.last
    end
    stack << i
  end

  stack = []
  (0...(arr.size)).reverse_each do |i|
    while !stack.empty? && arr[stack.last] >= arr[i]
      stack.pop
    end
    if !stack.empty?
      right[i] = stack.last
    end
    stack << i
  end

  (0...(min_windows.size)).each do |i|
    min_windows[i] = right[i] - left[i] - 1
  end

  hash = {}
  min_windows.each_with_index do |window, i|
    value = arr[i]
    if hash[window].nil?
      hash[window] = value
    else
      if hash[window] < value
        hash[window] = value
      end
    end
  end

  max = -100_000_000
  hash.keys.sort.reverse_each do |key|
    v = hash[key]
    # puts "#{key}, #{v}, #{max}"
    if v > max
      max = v
    else
      hash[key] = max
    end
  end

  result = []
  prev = nil

  (1..(arr.size)).reverse_each do |i|
    if hash[i]
      prev = hash[i]
      result << hash[i]
    else
      result << prev
    end
  end


  # p left
  # p right
  # p min_windows
  # p hash
  result.reverse
end

p riddle(arr)

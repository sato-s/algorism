require 'pry'
arr = %w[8979 4570 6436 5083 7780 3269 5400 7579 2324 2116].map(&:to_i)

def calc(arr)
  stack = []
  results = []
  (0...(arr.size)).each do |i|
    if stack.empty? || arr[stack.last] <= arr[i]
      stack << i
    else
      while !stack.empty? && arr[stack.last] > arr[i]
        stack_last_index = stack.pop
        height = arr[stack_last_index]
        width = nil
        if stack.empty?
          width = i
        else
          width = i - stack.last - 1
        end
        results << height * width
      end
      stack << i
    end
  end

  while !stack.empty?
    stack_last_index = stack.pop
    height = arr[stack_last_index]
    width = nil
    if stack.empty?
      width = arr.size
    else
      width = arr.size - stack.last - 1
    end
    results << height * width
  end

  results.max

end


puts calc(arr)

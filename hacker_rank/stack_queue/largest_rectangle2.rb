# arr = [1, 2, 3, 4, 5]
require 'pry'
arr = [3, 2, 4]
arr = %w[8979 4570 6436 5083 7780 3269 5400 7579 2324 2116].map(&:to_i)

# stack = [1, 2, 3  ]
# arr[index] = 2

  def calc(arr)
    arr.unshift(0)
    arr.push(0)
    areas = []
    stack = []
    (0...(arr.size)).each do |index|
      if stack.empty? || arr[index] > arr[stack.last]
        # increasing
        stack << index
      else
        # decreased
        while !stack.empty? && arr[stack.last] >= arr[index]
          stack_last_index = stack.pop
          height = arr[stack_last_index]
          if stack.empty?
            width = index + 1 - 2
          else
            width = index - stack.last + 1 - 2
            puts "width: #{width}, #{index}- #{stack.last}"
          end
          area = width * height
          puts "#{arr[stack_last_index]}: #{arr[index]}, area: #{area}"
          areas << area
        end
        stack << index
      end
    end
    areas.max
  end

p calc(arr)

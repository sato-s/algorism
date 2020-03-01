# arr = [1, 2, 3, 4, 5]
require 'pry'
arr = [3, 2, 4, 5]
arr = %w[8979 4570 6436 5083 7780 3269 5400 7579 2324 2116].map(&:to_i)

def calc(arr)
  stack = []
  areas = []

  (0...(arr.size)).each do |i|
    if stack.empty? || arr[i] >= arr[stack.last]
      stack << i
    else
      while !stack.empty? && arr[i] < arr[stack.last]
        popped_index = stack.pop
        # 高さはpopped_index ではなくarr[popped_index]
        height = arr[popped_index]
        width = nil
        # emptyの場合は、widthが違う
        if stack.empty?
          width = i
        else
          width = i - stack.last
        end
        areas << height * width
      end
      # こっちの分岐に入った場合もスタックの行進が必要（一敗）
      stack << i
    end
  end

  while !stack.empty?
    popped_index = stack.pop
    height = arr[popped_index]
    width = nil
    if stack.empty?
      width = arr.size
    else
      width = arr.size - stack.last
    end
    areas << height * width
  end

  return areas.max

end

puts calc(arr)

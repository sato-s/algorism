#!/bin/ruby

require 'json'
require 'stringio'

# Complete the largestRectangle function below.

def calc(h)
  max_area = 0
  stack = [{index: 0, height: h[0]}]
  (1...(h.size)).each do |i|
    if h[i] >= h[i - 1]
      stack.push({index: i, height: h[i]})
    else
      poped = false
      x_index = nil
      while !(stack.empty? || stack.last[:height] < h[i])
        poped = true
        x = stack.pop
        x_index = x[:index]
        area = x[:height] * (i - x[:index])
        puts "area:#{area}, x:#{x}, i:#{i}"
        if area > max_area
          max_area = area
        end
      end
      if poped
        if stack.empty?
          stack.push({index: 0, height: h[i]})
        else
          stack.push({index: x_index, height: h[i]})
        end
      end
    end
  end
  p stack
  areas = stack.map{|hash| hash[:height] * (h.size - hash[:index])}

  ([max_area] + areas).max
end

def largestRectangle(h)
  calc(h)
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

h = gets.rstrip.split(' ').map(&:to_i)

result = largestRectangle h

fptr.write result
fptr.write "\n"

fptr.close()


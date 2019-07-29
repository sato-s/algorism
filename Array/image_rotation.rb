# Rotate Matrix: Given an image represented by an NxN matrix, where each pixel in the image is 4
# bytes, write a method to rotate the image by 90 degrees. Can you do this in place?
# Hints: «51,0100
require 'pry'

N = 4
image = (1..N).map{(0...N).to_a}
p image

(1...N).each do |j|
  (0...j).each do |i|
    # binding.pry
    tmp = image[i][j]
    image[i][j] = image[j][i]
    image[j][i] = tmp
  end
end

p image

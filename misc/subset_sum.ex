defmodule SubsetSum do
  def sum(array, target) when length(array) == 0 do
    target == 0
  end

  def sum(array, target) when length(array) == 1 do
    target == List.first(array)
  end

  def sum(array, target_value) do
    [head|tail] = array
    sum(tail, target_value) || sum(tail, target_value - head)
  end
end

IO.inspect SubsetSum.sum([2,3,4,5,6,7,8,9,10], 54) # => True
IO.inspect SubsetSum.sum([2,3,4,5,6,7,8,9,10], 53) # => False

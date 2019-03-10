defmodule LIS do

  def lis(arr, _target) when length(arr) == 0 do
    0
  end

  def lis(arr, target) do
    [head | tail] = arr
    if head > target do
      Enum.max([LIS.lis(tail, target), 1 + LIS.lis(tail, head)])
    else
      lis(tail, target)
    end
  end

end

# arr = [1,2,30,31,4,5,6]
# arr = [10, 22, 9, 33, 21, 50, 41, 60, 80]
arr = [0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15]
s = LIS.lis arr, -100000
IO.puts s

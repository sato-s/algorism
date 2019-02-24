defmodule LIS do
  def lis(arr, n) do
    if length(arr) == 1 do
      if List.first(arr) > n do
        1
      else
        0
      end
    else
      [head | tail] = arr
      # IO.inspect arr , charlists: :as_lists
      if n <= head do
        a = combination(tail)
          |> Enum.map(fn(x) -> lis(x, head) end)
          |> Enum.max
        1 + a
      else
        a = combination(tail)
          |> Enum.map(fn(x) -> lis(x, n) end)
          |> Enum.max
        a
      end
    end
  end


  def combination(arr) do
    (0..(length(arr)-1))
    |> Enum.map(fn(x) -> Enum.drop(arr, x) end)
  end
end

arr=[10, 22, 9, 33, 21, 50, 41, 60, 80, 61, 62] # => 6
s = LIS.lis arr, 0
IO.puts s

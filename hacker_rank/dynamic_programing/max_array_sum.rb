arr = [3, 5, -7, 8, 10]

$memo = {}
def ss2(arr)
  memo = Array.new(arr.size)
  i = 0
  (0...(arr.size)).reverse_each do |i|
    t = arr[i]
    if i == arr.size - 1
      if t > 0
        memo[i] = t
      else
        memo[i] = 0
      end
    elsif i == arr.size - 2
      sum1 = t
      sum2 = memo[i + 1]
      memo[i] = [sum1, sum2].max
    else
      sum1 = t + memo[i + 2]
      sum2 = memo[i + 1]
      memo[i] = [sum1, sum2].max
    end
  end
  return memo[0]

end


####  This recursive solution is effective enough but hakcer rank give me runntime error
####  According to discussion, this is hacker rank limitation
# def ss(arr, i)
#   if $memo[i]
#     return $memo[i]
#   end
#
#   if i === arr.size - 1
#     if arr[i] > 0
#       $memo[i] = arr[i]
#       return arr[i]
#     else
#       return 0
#     end
#   end
#
#   if i >= arr.size
#     return 0
#   end
#
#   first = arr[i]
#   sum1 = first + ss(arr, i + 2)
#   sum2 = ss(arr, i + 1)
#   result =  [sum1, sum2].max
#   $memo[i] = result
#   return result
# end
#
p ss2(arr)

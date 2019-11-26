arr = [3, 5, -7, 8, 10]

def ss(arr)
  if arr.empty?
    return 0
  end
  if arr.size === 1
    if arr.first > 0
      return arr.first
    else
      return 0
    end
  end

  first = arr.first
  rest = arr[1...(arr.size)]

  sum1 = first + ss(rest[1...(rest.size)])
  sum2 = ss(rest)
  return [sum1, sum2].max
end

p ss(arr)


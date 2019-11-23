arr = [2,1,3,1,2]

$count = 0

def mergeSort(arr)
  return arr if arr.size === 1

  m = arr.size / 2
  a1 = arr[0...m]
  a2 = arr[(m)...(arr.size)]

  a1 = mergeSort(a1)
  a2 = mergeSort(a2)

  result = []
  while (!a1.empty? || !a2.empty?)
    if a1.empty?
      result << a2.shift
    elsif a2.empty?
      result << a1.shift
    else
      if a1.first > a2.first
        result << a2.shift
        # shifted length
        $count += a1.size
      else
        result << a1.shift
      end
    end
  end

  return result
end


p mergeSort(arr)

p $count

__END__

7 5 3 1

[5 7] [1 3]  # 2

1 [5 7] [3] # 3
1 3 [5 7]  # 4

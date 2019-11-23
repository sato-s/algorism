arr = [1,4,65,3,100,20,5,2,9]
# arr = [1,4]

def mergeSort(arr)
  size = arr.size
  if size === 1
    return arr
  end

  m = size / 2
  a1 = arr[0...m]
  a2 = arr[m..arr.size]
  p a1
  p a2

  a1 = mergeSort(a1)
  a2 = mergeSort(a2)
  p "merged"
  p a1
  p a2

  result = []
  until (a1.empty? && a2.empty?)
    p "l"
    p a1
    p a2
    if a1.empty?
      result << a2.shift
    elsif a2.empty?
      result << a1.shift
    else
      if a1.first > a2.first
        result << a2.shift
      else
        result << a1.shift
      end
    end
    p "l2"
    p a1
    p a2
  end
  p 'result'
  p result
  result
end

p mergeSort(arr)

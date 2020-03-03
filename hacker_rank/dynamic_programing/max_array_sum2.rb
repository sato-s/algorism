arr = [-2, 1, 3, -4, 5]

def max_array_sum(arr)
  max_subset_sums = Array.new(arr.size)

  (0...(arr.size)).each do |i|
    if i.zero?
      max_subset_sums[i] = arr[i] > 0 ? arr[i] : 0
    elsif i == 1
      max_subset_sums[i] = [0, arr[0], arr[1]].max
    else
      # ignore i-th element just use previous max
      subset_sum1 = max_subset_sums[i-1]
      # aquire i-th element and forget [i-1] el
      subset_sum2 = max_subset_sums[i - 2] + arr[i]
      max_subset_sums[i] = [subset_sum1, subset_sum2].max
    end
  end

  max_subset_sums.last
end

p max_array_sum(arr)

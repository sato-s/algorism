# Given an integer array of size n, find the maximum of the minimum(s) of every window size in the array. The window size varies from 1 to n.
#
# For example, given [6, 3, 5, 1, 2]
#
# Sample Input 0
#
# 4
# 2 6 1 12
# Sample Output 0
#
# 12 2 1 1
require 'pry'
# arr = [2, 6, 1, 3, 0]
arr = [2, 6, 1, 12]
arr = %w[1 2 3 5 1 13 3].map(&:to_i)

arr = %w|338861636 746392954 307196980 99067465 558432115 227421873 794286875 723412073 367233970 106205871 827272521 769842060 731038313 210163756 14762131 524078854 996373388 364749541 555468976 76225538 228965926 669746786 65840090 823516800 168768899 173445545 970027207 390557850 983670014 72348381 132245024 998742114 973368515 572064066 695638860 490405718 844068132 545204755 327755108 909260844 733712560 400505846 242522726 565969843 61327665 908018319 972088061 957574905 487935283 754595437 964446775 21609294 248550165 546865187 47751807 922684557 400325186 918259166 217214762 821293848 542409791 24229773 704353370 747554744 154606034 394698021 113758632 361606437 288102830 728428074 266846128 828133198 707337820 288568226 894829092 59190652 905527200 582774491 263478437 872923776 363759675 633497945 846898051 569011891 3251607 457997069 239086919 262332508 27443470 582018960 394231465 888400883 813847060 976964155 515615646 431824405 377146718 587447608 755690611 543236620 896772406 4739829 412893149 872000965 649106700 796002123 173268471 716918241 729662697 164844792 633217447 803925919 877736709 576599945 522438731 674161217 423481793 119633641 865849708 974269088 535541596 811353179 387094873 51178535 945667894 906922732 59484739 742719125 382946053 564400412 746284364 606053715 584988704 400577274 589976668 247157665 271283578 317021226 798543140 265419552 609106691 341069751 124295549 625251506|.map(&:to_i)

def riddle(arr)
  # Append (almost) minus infinity here
  arr << -10 ** 100

  stack = []
  hash = {}
  (0...(arr.size)).each do |i|
    if i == 0
      stack << i
    elsif arr[i-1] <= arr[i]
      stack << i
    else
      while !stack.empty? do
        break if arr[stack.last] < arr[i]
        j = stack.pop
        v = arr[j]
        # binding.pry if v == 2
        if stack.empty?
          hash[v] = i - 0
        else
          # hash[v] = #j - stack.last
          hash[v] = i - stack.last - 1
        end
      end
      stack << i
    end
  end
  summary = {}
  hash.each_pair do |k,v|
    if summary[v]
      if summary[v] < k
        summary[v] = k
      end
    else
      summary[v] = k
    end
  end

  # Calc summary
  result = []
  prev = nil
  (1..(arr.size - 1)).to_a.reverse.each do |i|
    if summary[i]
      prev = summary[i]
      result << summary[i]
    else
      result << prev
    end
  end
  result.reverse!
  (0...(result.size)).each do |i|
    ((i + 1)...(result.size)).each do |j|
      if result[j] > result[i]
        result[i] = result[j]
      end
    end
  end

  return result
end

p riddle(arr)

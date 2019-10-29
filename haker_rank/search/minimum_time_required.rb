input = <<EOF
3 10
1 3 4
EOF

input = <<AA
500 927
57495 63591 21578 16040 46349 22497 72176 59262 88198 38894 85865 6606 53218 9954 50649 66341 70853 50416 96450 89258 4692 76228 38939 56820 11252 98931 57870 8651 11694 75578 95577 85541 39168 33507 17932 85516 56003 90107 61129 44200 45352 63345 67157 14922 73298 17805 97614 44151 68221 94064 33408 89264 70291 72346 46083 97894 71277 20305 6544 99322 95882 18473 1214 51402 51979 19145 53269 7981 25604 14398 68532 70955 77742 35689 85876 67392 69845 83490 27894 38065 77553 77653 27329 64195 66351 89763 78441 53979 26419 84984 53300 38653 19808 54514 90054 71786 90010 43322 96118 15613 74071 81002 86568 51813 16690 88795 35556 2886 88636 63449 40951 82540 41101 84631 63087 7451 90745 41527 61429 17164 42862 31081 55816 62670 1946 45869 50807 91955 5542 63277 7568 79613 44278 10487 31425 77319 99281 83332 80204 87917 46780 37506 86808 4232 38488 49894 11683 29233 91420 89463 46396 34282 20543 18563 96951 22488 64431 64109 30795 69972 27385 38362 65936 88014 48848 97360 65332 64480 97043 61888 68748 43822 99393 55556 48054 37881 5449 76088 67113 13221 65550 29860 47502 2445 48422 60804 41284 12852 24912 72078 99175 68649 26791 65111 56662 91990 78822 21994 56470 75865 83881 41569 36038 99625 97124 443 37505 18925 76530 20969 32145 58432 50828 79646 77228 15601 56801 34863 44804 98064 6941 43979 66712 50083 25441 23374 42073 20614 61719 14894 12830 61951 56462 65220 61575 69938 65662 15432 88862 42192 52752 21006 16975 3580 17003 94202 35532 73803 29064 80336 71866 52356 40666 54930 18791 66106 78303 77215 3071 56373 92108 15901 18323 64921 97472 96249 34858 63133 11680 40071 21676 64432 61076 38650 84363 94430 49203 19894 84584 94619 16581 72802 63326 57246 27731 82116 23351 22385 75682 42774 95109 67789 75026 13431 32710 72497 9679 83919 35629 37711 23990 57305 18494 1417 12306 19208 12199 77861 55453 96782 88831 72034 85935 52156 29279 30017 50624 68982 52401 26305 11755 47509 10446 3132 77291 59507 75628 3322 43425 27608 57384 67414 84912 92229 85183 13570 11436 97381 7782 83240 94162 96612 55273 96449 65119 904 26465 32094 69885 95218 58399 97991 59078 85196 17474 36369 44702 93101 56042 88126 20708 13425 71892 21972 5653 73426 51893 33440 70806 59674 16679 81319 56285 88304 77767 21403 89207 4232 53497 75443 99449 28247 89785 58526 29794 7258 11246 74495 358 67287 78972 37417 80711 67215 75740 2715 40640 27632 36154 11445 87305 52833 9116 59941 41136 86882 97696 46694 91113 67544 22136 6913 12142 28272 81791 41935 35529 93036 32781 52238 60323 11752 89654 57385 95319 81746 76452 35958 9377 12605 63755 13034 65437 72870 89326 22924 59751 87021 69617 67216 70916 8104 90480 83057 36375 72270 41343 88255 81658 74123 40492 58332 2227 46498 32068 97545 28243 8519 33502 37619 21124 13608 67004 2912 86477 56330 42188 62580 43350 11804 46147 14266 36260 52978 13674 88986 25248 55017 77241 23257 45491 17732 81588 47717 64229 13655 45261 8823 22174 95115 46442 59649 25074 29797 62560 11551 86126 21099 90482 45828
AA
# +> 45261
#
#
# goal < 10 ** 9

require 'json'
require 'stringio'

def production(machines, day)
  productions = machines.map{|m| day / m}
  productions.reduce(&:+)
end

# Complete the minTime function below.
def minTime(machines, goal)
  # n = 1, machines[0] =1, goal = 10 ** 9
  start_day = 0
  end_day = 10 ** 18

  while start_day <= end_day do
    mid = (end_day + start_day) / 2
    count1 = production(machines, mid - 1)
    count2 = production(machines, mid)
    if count2 >= goal && count1 < goal
      return mid
    elsif count2 < goal
      start_day = mid + 1
    elsif count1 >= goal
      end_day = mid - 1
    else
      raise 'never reach here'
    end
    # if count == goal
    #   puts "goal: #{mid}, count: #{count}"
    #   return mid
    # elsif count < goal
    #   start_day = mid + 1
    # else
    #   end_day = mid - 1
    # end

  end


end

# fptr = File.open(ENV['OUTPUT_PATH'], 'w')

nGoal = input.lines[0].rstrip.split

n = nGoal[0].to_i

goal = nGoal[1].to_i

machines = input.lines[1].rstrip.split(' ').map(&:to_i)

ans = minTime machines, goal
p ans

# fptr.write ans
# fptr.write "\n"
#
# fptr.close()
#


__END__
You are planning production for an order. You have a number of machines that each have a fixed number of days to produce an item. Given that all the machines operate simultaneously, determine the minimum number of days to produce the required order.

For example, you have to produce  items. You have three machines that take  days to produce an item. The following is a schedule of items produced:

Day Production  Count
2   2               2
3   1               3
4   2               5
6   3               8
8   2              10
It takes  days to produce  items using these machines.

Function Description

Complete the minimumTime function in the editor below. It should return an integer representing the minimum number of days required to complete the order.

minimumTime has the following parameter(s):

machines: an array of integers representing days to produce one item per machine
goal: an integer, the number of items required to complete the order
Input Format

The first line consist of two integers  and , the size of  and the target production. 
The next line contains  space-separated integers, .

Constraints

Output Format

Return the minimum time required to produce  items considering all machines work simultaneously.

Sample Input 0

2 5
2 3
Sample Output 0

6
Explanation 0

In  days  can produce  items and  can produce  items. This totals up to .

Sample Input 1

3 10
1 3 4
Sample Output 1

7
Explanation 1

In  minutes,  can produce  items,  can produce  items and  can produce  item, which totals up to .

Sample Input 2

3 12
4 5 6
Sample Output 2

20
Explanation 2

In  days  can produce  items,  can produce , and  can produce .

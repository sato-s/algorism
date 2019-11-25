require 'pry'
# 1 <= m,w,p,n <= 10 ** 12
# m: long integer, the starting number of machines
# w: long integer, the starting number of workers
# p: long integer, the cost of a new hire or a new machine
# n: long integer, the number of candies to produce
# passws < 10 ** 12

# Sample input
# 3 1 2 12
# Sample Output
# 3
#
#
#
# Answer in python
# def minimumPasses(machine, worker, p, n): 
#     if n <= p: return math.ceil(n / (machine * worker))
#     curr = candy = 0 
#     ans = float('inf')
#     while candy < n:
#         if candy < p:
#             # can't buy
#             # Progress days to when we can buy candies
#             i = math.ceil((p - candy) / (machine * worker))
#             curr += i
#             candy += machine * worker * i
#             continue
#         buy,candy = divmod(candy , p) 
#         total = machine + worker + buy 
#         half = total // 2
#         if machine > worker : 
#             machine = max(machine, half) 
#             worker = total - machine
#         else:
#             worker = max(worker, half) 
#             machine = total - worker
#         curr += 1 
#         candy += machine * worker 
#         ans = min(ans, curr + math.ceil((n - candy) / (machine * worker)))
#
#     return min(ans, curr)

input = "3 1 2 12"

# 2:
# 1:

def count_production(m, w, p, passes)
  initial_money = m * w

  smaller = nil
  bigger = nil
  if m > w
    bigger = m
    smaller = w
  else
    bigger = w
    smaller = m
  end

  diff = bigger - smaller

  count = 0

  passes.times do |i|
    count += m * w
    if count >= p && i != passes - 1
      buy = count / p
      buy.times do
        if m > w
          w += 1
        else
          m += 1
        end
      end
      count -= buy * p
      # count = 0
    end
    # p i
  end
  count
end

def minimumPasses(m, w, p, n)
  start_pass = 1
  end_pass = 10 ** 12
  while (start_pass < end_pass) do
    puts "#{start_pass}, #{end_pass}"
    mid = (end_pass - start_pass) / 2
    puts "1"
    production1 = count_production(n, w, p, mid - 1)
    puts "2"
    production2 = count_production(n, w, p, mid)
    puts "3"
    if production1 < n && production2 >= n
      return mid
    elsif production2 < n
      start_pass = mid + 1
    elsif production1 >= n
      end_pass = mid
    else
      raise 'Never reach here.'
    end
  end
  raise 'Never reach here.'
end

mwpn = input.rstrip.split

m = mwpn[0].to_i
w = mwpn[1].to_i
p = mwpn[2].to_i
n = mwpn[3].to_i

result = minimumPasses m, w, p, n
p result
# p count_production(1,1,1, 3)
# 1 * 1 => 1
# 2 * 1 => 3
# 2 * 3 => 6
# 6 * 5 => 30
#
__END__

How to finish in 16 turns
The goal can be achieved in 16 steps with 5 machines and 5 workers.

In turn 13, when you have 3 machines and 3 workers and you have more than enough candies (11) to buy another, doing so will net you the same steps (17).

If you decide to buy anyway (since "you lose nothing"), now you have a production of 12, since you are dividing your assets for maximum gain (3 and 4).

This means that you can now buy 2 assets right away in turn 14. And it won't even deplete you; you will be left with 5 candies and a production of 20 (4 and 5).

Two turns later, you win. Sixteen turns.

On the nature of 17
(Just to be clear about why the original path is longer. As mentioned, on turn 13 you have a production of 9 and 11 candies; so you need 34 more. That is ceil(34/9) = 4 turns to go: Seventeen total.)

Conclusion (i.e. TL;DR)
If you are going greedy, go full greedy (in this context, obviously) and buy even if there is no apparent gain, as long as there is no loss. -- This in no way relates to my life views.

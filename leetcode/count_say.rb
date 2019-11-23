# https://leetcode.com/submissions/detail/256507906/
def c(n)
    return [1] if n == 1
    return [1,1] if n == 2
    arr = c(n-1)
    hashes = []
    current = {val: arr[0], count: 1}
    (1...(arr.size)).each do |i|
        if arr[i] == arr[i-1]
           current = {val: current[:val], count: current[:count] + 1} 
        else 
            hashes << current
            current = {val: arr[i], count: 1}
        end
    end
    hashes << current
    result = []
    hashes.each do |hash|
        result << hash[:count]
        result << hash[:val]
    end
    result 
end

def count_and_say(n)
    c(n).join
end

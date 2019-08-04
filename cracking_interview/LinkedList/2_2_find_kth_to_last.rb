require_relative 'list'

list = LinkedList.new([1,2,3,4,5,3,1,10])

p list.find_kth_to_last(4)

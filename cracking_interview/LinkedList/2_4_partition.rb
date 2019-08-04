require_relative 'list_mono_direction'

list = LinkedList.new([1,2,3,4,5,3,1,10,3, 20])

list.partition(5)
p list

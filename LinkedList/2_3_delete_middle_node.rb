require_relative 'list_mono_direction'
list = LinkedList.new([1,2,3,4,5,3,1,10])
p list
list.root.next.next.delete
p list

class Node
  attr_accessor :val, :right, :left

  def initialize(value)
    @value = value
  end

  def insert(other)
    if @value > other
      insert_left(other)
    else
      insert_right(other)
    end
  end

  def count_bigger_than(other)
  end

  private
  def insert_left(other)
    if @left
      @left.insert(other)
    else
      @left = self.class.new(other)
    end
  end

  def insert_right(other)
    if @right
      @right.insert(other)
    else
      @right = self.class.new(other)
    end
  end

end

class BTree
  def initialize(arr)
    @root = Node.new(arr.first)
    arr[1..-1].each do |a|
      @root.insert(a)
    end
  end
end

arr= [2, 1, 3, 1, 2]

b = BTree.new arr



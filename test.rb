require 'pry'

class Node
  attr_accessor :right, :left
  attr_reader :value
  def initialize(value)
    @value = value
    @right = nil
    @left = nil
  end

  def insert(val, right_val, left_val)
    if @value == val
      @right = self.class.new(right_val) if right_val != -1
      @left = self.class.new(left_val) if left_val != -1
    else
      @right.insert(val, right_val, left_val) if @right
      @left.insert(val, right_val, left_val) if @left
    end
  end

  def swap(depth, k)
    if depth % k == 0
      tmp = @right
      @right = @left
      @left = tmp
    end
    @left.swap(depth + 1, k) if @left
    @right.swap(depth + 1, k) if @right
  end

  def post_order_search
    result = []
    result += @left.post_order_search if @left
    result << @value
    result += @right.post_order_search if @right
    result
  end

end

input = <<-EOF
2 3
4 -1
5 -1
6 -1
7 8
-1 9
-1 -1
10 11
-1 -1
-1 -1
-1 -1
EOF

indexes = input.lines.map{|line| line.split.map(&:to_i)}

indexes.each_with_index do |n, i|
  val = i + 1
  left = n[0]
  right = n[1]
  if i == 0
    @root = Node.new(val)
    @root.left = Node.new(left)
    @root.right = Node.new(right)
  else
    @root.insert(val, right, left)
  end
end

@root.swap(1, 2)

binding.pry

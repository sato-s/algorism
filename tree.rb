#  maxDepth()
# 1. If tree is empty then return 0
# 2. Else
#      (a) Get the max depth of left subtree recursively  i.e., 
#           call maxDepth( tree->left-subtree)
#      (a) Get the max depth of right subtree recursively  i.e., 
#           call maxDepth( tree->right-subtree)
#      (c) Get the max of max depths of left and right 
#           subtrees and add 1 to it for the current node.
#          max_depth = max(max dept of left subtree,  
#                              max depth of right subtree) 
#                              + 1
#      (d) Return max_depth

class Node
  attr_reader :left, :right
  def initialize(value)
    @value = value
    @right = nil
    @left = nil
  end

  def insert(value)
    if value < @value
      insert_left(value)
    else
      insert_right(value)
    end
  end

  def inspect
    "#{@value}::(#{@left.inspect}|#{@right.inspect})"
  end

  def depth
    return 0 if leaf?
    children.map(&:depth).max + 1
  end

  def children
    nodes = []
    nodes.push(@right) if @right
    nodes.push(@left) if @left
    nodes
  end

  def leaf?
    @right.nil? && @left.nil?
  end

  private
  def insert_right(value)
    if @right
      @right.insert(value)
    else
      @right = self.class.new(value)
    end
  end

  def insert_left(value)
    if @left
      @left.insert(value)
    else
      @left = self.class.new(value)
    end
  end

end

class Tree
  attr_reader :root
  def initialize(values)
    @root = Node.new(values.shift)
    values.each { |value| @root.insert(value) }
  end

  def inspect
    @root.inspect
  end

  def depth
    @root.depth
  end
end

def depth2(node)
  children = []
  children.push(node.right) if node.right
  children.push(node.left) if node.left
  return 0 if children.empty?
  children.map{ |node| depth2(children) }.max
end

tree = Tree.new([5, 4, 3, 10, 8, 2, 2])

p tree
puts "Tree Depth = #{tree.depth}"
depth2(tree.root)

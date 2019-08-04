class LinkedList
  attr_accessor :root
  def initialize(array)
    @root = Node.new(nil)
    array.each_with_index do |elem, index|
      if index == (array.size - 1)
        @leaf = @root.insert(elem)
      else
         @root.insert(elem)
      end
    end
  end

  # だめ。
  # deleteは、終端ノードに対して使用できない。
  # deleteを終端ノードに対して使用できるようにするには双方向リストを使うか、探査をやり直さなくてはならず、コスト台
  # def partition(n)
  #   bigger = Node.new(nil)
  #   node = @root.next
  #   last_node = node
  #   while !node.nil?
  #     if node.value >= n
  #       bigger.insert(node.value)
  #       node.delete
  #     end
  #     node = node.next
  #     last_node = node unless node.nil?
  #   end
  #   last_node.next = bigger.next
  # end

  # 以下の2つのノードを用意するアプローチの方がいい
  def partition(n)
    bigger = Node.new(nil)
    smaller = Node.new(nil)
  end

  # def partition(n)
  #   head = Node.new(nil)
  #   first = head
  #   tail = Node.new(nil)
  #   while !node.nil?
  #     next_node = node.next
  #     if node.value >= n
  #       head.next = node
  #       head = node
  #     else
  #       tail.next = node
  #       tail = node
  #     end
  #     node = next_node
  #   end
  #   head.next = tail.next
  #
  # end

end

class Node
  attr_accessor :next, :value
  def initialize(value)
    @value = value
    @next = nil
  end

  def insert(value)
    if @next
      @next.insert(value)
    else
      node = self.class.new(value)
      @next = node
    end
  end

  def delete
    if middle?
      @value = @next.value
      @next = @next.next
    else
      raise "this is not middle node #{@value}"
    end
  end

  def middle?
    !!@next
  end

  def inspect
    "#{} < #{@value} > #{@next.inspect}"
  end
end



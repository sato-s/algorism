class LinkedList
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

  def remove_dup
    @root.remove_dup({})
  end

  def find_kth_to_last(k)
    @root.find_kth_to_last(0, k)
  end

end

class Node
  attr_accessor :next, :prev
  def initialize(value)
    @value = value
    @next = nil
    @prev = nil
  end

  def insert(value)
    if @next
      @next.insert(value)
    else
      node = self.class.new(value)
      node.prev = self
      @next = node
    end
  end

  def find_kth_to_last(index, k)
    if index == k
      self
    else
      @next.find_kth_to_last(index + 1, k)
    end
  end

  def remove_dup(hash)
    if hash.has_key? @value
      if @prev
        @prev.next = @next
        @next.prev = @prev
        @next.remove_dup(hash)
      end
    else
      hash[@value] = true
      if @next
        @next.remove_dup(hash)
      end
    end
  end

  def delete
    if middle?
      @prev.next = @next
      @next.prev = @prev
    else
      raise 'this is not middle node'
    end
  end

  def middle?
    @prev && @next
  end

  def inspect
    "#{} < #{@value} > #{@next.inspect}"
  end
end


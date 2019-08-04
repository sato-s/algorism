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

  def inspect
    "#{} < #{@value} > #{@next.inspect}"
  end
end


array = [1,2,3,4,5,3,1,10]
root = Node.new(nil)
array.each{|elem| root.insert(elem)}
p root
root.remove_dup({})
p root

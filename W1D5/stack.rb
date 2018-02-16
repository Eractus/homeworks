class Stack
  def initialize
    @stack = Array.new
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    p @stack
  end
end

p a = Stack.new
p a.add("Stack")
p a.add("Attack")
p a.remove
a.show

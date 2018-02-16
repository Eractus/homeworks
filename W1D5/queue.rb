class Queue
  def initialize
    @queue = Array.new
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    p @queue
  end
end

p a = Queue.new
p a.enqueue("Queue")
p a.enqueue("Dude")
p a.dequeue
a.show

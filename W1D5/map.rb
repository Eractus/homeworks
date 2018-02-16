class Map
  def initialize
    @map = Array.new
  end

  def assign(key, value)
    @map.each do |arr|
      if arr[0] == key
        @map[@map.index(arr)] << value
      else
        @map << [key, value]
      end
    end
  end

  def lookup(key)
    @map.map do |arr|
      arr[0]
    end
  end

  def remove(key)
    @map.each do |arr|
      @map.delete()
  end

  def show
    p @map
  end
end

a = Map.new
p a.assign('a', 3)
p a.assign('b', 16)
p a.assign('a', 8)
p a.lookup('a')
a.show

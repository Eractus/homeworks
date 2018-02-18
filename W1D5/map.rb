class Map
  def initialize
    @map = Array.new
  end

  def assign(key, value)
    if @map.any? {|arr| arr[0] == key}
      @map.each do |arr|
        @map[@map.index(arr)][-1] = value if arr[0] == key
      end
    else
      @map << [key, value]
    end
  end

  def lookup(key)
    @map.each do |arr|
      if arr[0] = key
        return arr[-1]
      end
    end
  end

  def remove(key)
    if @map.any? {|arr| arr[0] == key}
      @map.each do |arr|
        return @map.delete(arr) if arr[0] == key
      end
    end
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
p a.remove('b')
a.show

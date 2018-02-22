class Array
  #Hungry Octopus
  def sluggish_octopus
    self.each do |fish1|
      longest_fish = fish1
      self.each do |fish2|
        longest_fish = fish2 if fish1.length < fish2.length
      end
    end
    longest_fish
  end

  def dominant_octopus(&prc)
    prc ||= Proc.new { |x, y| x<=> y }
    return self if self.length == 1
    mid = self.length/2
    left = self.take(mid).dominant_octopus(&prc)
    right self.drop(mid).dominant_octopus(&prc)
    Array.merge(left, right, &prc)
  end

  def self.merge(left, right, &prc)
    result = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
        when -1
          result << left.shift
        when 0
          result << left.shift << right.shift
        when 1
          result << right.shift
      end
    end
    result + left + right
  end

  def clever_octopus
    longest_fish = self.first
    i = 1
    while i < self.length
      longest_fish = self[i] if self[i].length > longest_fish
      i += 1
    end
    longest_fish
  end
  #Dancing Octopus
  def slow_dance(direction)
    tent_idx = nil
    self.each_with_index do |dir, idx|
      tent_idx = idx if dir == direction
    end
    tent_idx
  end

  def constant_dance(direction)
    hash = {}
    self.each_with_index do |dir, idx|
      hash[dir] = idx
    end
    hash[direction]
  end
end

class Board
  attr_reader :name1, :name2
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    self.place_stones
  end

  def place_stones
    self.cups[0..5].each do |cup|
      4.times { cup << :stone}
    end
    self.cups[7..12].each do |cup|
      4.times { cup << :stone}
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos == 0 || start_pos > 12
    raise "Invalid starting cup" if self.cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = self.cups[start_pos]
    cup_idx = start_pos
    until stones.empty?
      cup_idx = (cup_idx + 1) % 14
      if cup_idx == 6
        self.cups[cup_idx] << stones.pop if current_player_name == self.name1
      elsif cup_idx == 13
        self.cups[cup_idx] << stones.pop if current_player_name == self.name2
      else
        self.cups[cup_idx] << stones.pop
      end
    end
    self.render
    self.next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if self.cups[ending_cup_idx].size == 1
    return ending_cup_idx unless self.cups[ending_cup_idx].empty?
  end

  def render
    # print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    # puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    # print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    # puts ""
    # puts ""
  end

  def one_side_empty?
    self.cups[0..5].all? { |cup| cup.empty? } ||
    self.cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    name1_count = self.cups[6].size
    name2_count = self.cups[13].size
    return :draw if name1_count == name2_count
    return self.name1 if name1_count > name2_count
    self.name2 if name1_count < name2_count
  end
end

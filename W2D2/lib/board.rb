class Board
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
    stones = self.cups[start_pos].size
    self.cups[start_pos] = []
    ending_pos = (start_pos + stones) % 14
    self.cups[(start_pos+1)..(ending_pos)].each do |cup|
      if self.cups.index(cup)%14 == 6
        cup << :stone if current_player_name == self.name1
      elsif self.cups.index(cup)%14 == 13
        cup << :stone if current_player_name == self.name2
      else
        cup << :stone
      end
    end
    self.render
    self.next_turn(ending_pos)
  end

  def next_turn(ending_cup_idx)
    return :switch if self.cups[ending_cup_idx].size == 1
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return ending_cup_idx if self.cups[ending_cup_idx].empty?
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
  end
end

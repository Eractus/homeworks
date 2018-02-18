class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until self.game_over == true
      self.take_turn
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
    system('clear')
    self.show_sequence
    self.require_sequence
    if @game_over == false
      self.round_success_message
      sleep(1)
      @sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color
    self.seq.each do |color|
      puts color
      sleep(1)
      system('clear')
      sleep(0.5)
    end
  end

  def require_sequence
    self.seq.each do |color|
      puts "What is the current color of the sequence?"
      guess = gets.chomp
      if guess != color
        @game_over = true
        break
      end
      system('clear')
    end
  end

  def add_random_color
    self.seq << COLORS.sample
  end

  def round_success_message
    puts "Good job!"
  end

  def game_over_message
    puts "You lose!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $0
  Simon.new.play
end

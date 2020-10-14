class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until self.game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    system("clear)")
    require_sequence
    unless self.game_over
      round_success_message
      self.sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    self.seq.each do |color|
      puts color
      sleep(1)
      system("clear")
      puts " "
      sleep(1)
    end
  end

  def require_sequence
    self.seq.each do |color|
      puts "Enter the next color in the sequence"
      input = gets.chomp
      if input != color
        self.game_over = true
        break
      end
      system("clear")
    end
  end

  def add_random_color
    @seq += COLORS.sample(1)
  end

  def round_success_message
    puts "YOU SURVIVE... FOR NOW"
  end

  def game_over_message
    puts "YOU LOSE HAHAHAHAHA"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
    return
  end
end

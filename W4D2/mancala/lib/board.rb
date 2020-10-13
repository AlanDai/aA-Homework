class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { [] }
    self.place_stones
    # cup of name1 -> 6 and cup of name2 -> 13
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    (0...6).each { |i| @cups[i] = [:stone, :stone, :stone, :stone] }
    (7...13).each { |i| @cups[i] = [:stone, :stone, :stone, :stone] }
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos >= cups.length
    raise 'Starting cup is empty' if cups[start_pos].length == 0
    true
  end

  def make_move(start_pos, current_player_name)
    return unless valid_move?(start_pos)

    if current_player_name == @name1
      cur_player_index, opp_player_index = 6, 13
    else
      cur_player_index, opp_player_index = 13, 6
    end

    num_stones = cups[start_pos].length
    cups[start_pos] = []

    last_index = distribute_stones(start_pos, num_stones, opp_player_index)
    render
    next_turn(last_index, cur_player_index, opp_player_index)
  end

  def distribute_stones(start_index, num_stones, opp_cup_index)
    cur_index = (start_index + 1) % 14
    last_index = nil

    while num_stones > 0
      unless cur_index == opp_cup_index
        cups[cur_index] << :stone
        num_stones -= 1
        last_index = cur_index
      end
      cur_index = (cur_index + 1) % 14
    end

    return last_index
  end

  def next_turn(ending_cup_idx, cur_player_index, opp_player_index)
    if ending_cup_idx == cur_player_index
      return :prompt
    elsif cups[ending_cup_idx].length == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0...6].all? { |arr| arr.length == 0 } || cups[7..-1].all? { |arr| arr.length == 0 }
  end

  def winner
    if (cups[6].length <=> cups[13].length) == 1
      return @name1
    elsif (cups[6].length <=> cups[13].length) == -1
      return @name2
    else
      return :draw
    end
  end
end

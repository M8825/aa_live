require_relative 'board'
require_relative 'human_player'

# Main class, houses instances of Board and HumanPlayer
# It's responsible for passing data between the board and player
# It will also contain the main game loop
class Game 
  # Accepts symbol marks of player_1 and player_2 (:X)
  # Initializes curr_player - By default player_1
  def initialize(player_1_mark, player_2_mark)
    @player_1 = HumanPlayer.new(player_1_mark)
    @player_2 = HumanPlayer.new(player_2_mark)
    @board = Board.new
    @curr_player = @player_1
  end

  # Switches players back and forth
  def switch_turn
    @curr_player = @curr_player == @player_1 ? @player_2 : @player_1
  end

  # Runs the loop for a game by checking if there are empty positions in board
  # Asks current user for coordinates for their position
  # Places mark in board. If current player won prints victory message, otherwise
  # switches current player
  def play
    while @board.empty_position?
      @board.print
      input = @curr_player.get_position
      @board.place_mark(input, @curr_player.mark)

      if @board.win?(@curr_player.mark)
        puts "Victory #{@curr_player.mark}!!!"
        return
      else
        switch_turn
      end
    end

    puts "Draw"
  end

end
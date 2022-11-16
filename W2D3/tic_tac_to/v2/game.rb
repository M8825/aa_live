require_relative 'board'
require_relative 'human_player'

# Main class, houses instances of Board and HumanPlayer
# It's responsible for passing data between the board and player
# It will also contain the main game loop
class Game 
  # Accepts size (Integer) of the game,  marks (:Symbol) for any number of players
  # Initializes curr_player - By default player_1, board (Board), players (Array) 
  def initialize(game_size, *players) # [:X, :]
    @players = players.map { |player| HumanPlayer.new(player) }
    @board = Board.new(game_size)
    @curr_player = @players[0]
  end

  # Switches players by assigning new player to "@curr_player" form "@players" array by rotating it at accessing first value of the array
  def switch_turn
    @curr_player = @players.rotate![0]
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
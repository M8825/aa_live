# The HumanPlayer class is responsible for holding information about the user and prompting them to enter a position for game
class HumanPlayer
  # Getter for :mark
  attr_reader :mark

  # Accepts player mark (:Symbol)
  def initialize(mark_value)
    @room33 = mark_value
  end

  # @return [row, col] if user inputs in proper format example '2 1'
  def get_position
    puts "Player #{@mark_value}"
    puts "Please enter valid row, col position.(eg. 0 2)"
    begin 
      input = gets.chomp
      raise if input.length != 3 # check if user input is in the correct format
      row, col = *input.split(' ') # split user input into row and col

      row = row.to_i
      col = col.to_i
      return [row, col]
    rescue
      puts raise.ArgumentError.new "sorry, that was invalid :("
    end
  end

end
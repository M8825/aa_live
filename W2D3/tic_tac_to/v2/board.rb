
# The Board class is responsible for adding a player's marks, checking for winners
# and printing the game board. It has attribute to represent the grid. For simplicity grid is 3x3
class Board

  # Accepts num (Integer). Parameter represents size of the grid
  # Initializes the grid [Array] of num (Integer) size
  def initialize(num)
    @grid = Array.new(num) { Array.new(num, '_') }
  end


    # Accepts position (Array)
    # Returns boolean indication wether or not given position is "in bounds"
  def valid?(position)
    row = position[0]
    col = position[1]

    @grid[row] != nil && @grid[row][col] != nil && (row >= 0 && col >= 0)
  end

  # Accepts position (Array)
  # Returns boolean indicating whether or not the specified position does not contain a player's mark 
  def empty?(position)
    @grid[position[0]][position[1]] == '_'
  end

  # accepts position (Array) and mark (Symbol)
  # Checks if board is valid (valid?) and given position is empty (empty?(position))
  def place_mark(position, mark)
    if valid?(position) && empty?(position)
      @grid[position[0]][position[1]] = mark
    else
      raise RuntimeError.new("invalid Mark")
    end
  end

  # Displays the board
  def print
    @grid.each do |row|
      puts " #{row} "
      puts
    end
  end


  # Accepts mark (:X) Symbol
  # Return boolean indicating whether or not the given mark has completely filled up any row
  def win_row?(mark)
    @grid.each do |row|
      return true if row.all? { |ele| ele == mark }
    end

    return false
  end


  # Accepts mark (:X) Symbol
  # Return boolean indicating whether or not the given mark has completely filled up any column
  def win_col?(mark)
    @grid.transpose.each do |row|
      return true if row.all? { |ele| ele == mark }
    end

    return false
  end


  # Accepts mark (:X) Symbol
  # Return boolean indicating whether or not the given mark has completely filled up any diagonal
  def win_diagonal?(mark)
    num_of_rows = @grid[0].length
    p, s = 0, 0

    (0...num_of_rows).each do |i|
      p += 1 if @grid[i][i] == mark
      s += 1 if @grid[i][num_of_rows - 1 - i] == mark
    end

    return p == @grid.length || s == @grid.length
  end


  # Accepts mark (:X) Symbol
  # This method should return a boolean indicating whether or not the given mark has filled any full row, column, or diagonal. 
  def win?(mark)
    win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
  end


  # This method should return a boolean indicating whether or not there is at least one empty position on the grid.
  def empty_position?
    @grid.each do |row|
      return true if row.any? { |ele| ele == '_'}
    end

    false
  end
end
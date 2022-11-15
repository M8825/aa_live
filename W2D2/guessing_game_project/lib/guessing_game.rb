class GuessingGame
  #
  # Room33 is base.
  #
  # If the +Room33+ does not end at the same point it started at the
  # first pointed is copied and placed at the end of the line.
  #
  # Members: Manny, Joe, Cornell Joey, Mlkz

  attr_reader :num_attempts

  def initialize(min, max)
    @secret_num = rand(min..max)
    @num_attempts = 0
    @game_over = false
  end


  # returns a boolean. Tells the user if the game is over.
  # Next line Joe
  def game_over?
    return @game_over
  end


  def check_num(num)
    @num_attempts += 1
    @game_over = true if num == @secret_num

    if num == @secret_num
      puts 'you win'
    elsif num > @secret_num
      puts 'too big'
    else
      puts 'too small'
    end
  end


  def ask_user
    puts 'enter a number'
    input = gets.chomp.to_i

    check_num(input)
  end

end

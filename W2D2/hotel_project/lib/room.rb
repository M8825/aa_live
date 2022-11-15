class Room
  attr_reader :capacity, :occupants # when they ask for a return 
  def initialize(capacity)
    @capacity = capacity
    @occupants = []
  end

  def full?
    @occupants.length < @capacity ? false : true
  end

  def available_space
    @capacity - @occupants.length
  end

  def add_occupant(str)
    if full? 
        return false
    else
        @occupants << str
        return true
    end
  end
end
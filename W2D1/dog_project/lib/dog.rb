class Dog
  def initialize(name, breed, age, bark, favorite_foods)
    @name = name
    @breed = breed
    @age = age
    @bark = bark
    @favorite_foods = favorite_foods
  end

  def name
    return @name
  end

  def breed
    return @breed
  end

  def age
    return @age
  end

  # bark getter
  def bark
    return @age > 3 ? @bark.upcase : @bark.downcase
  end

  # favorite_foods getter method
  def favorite_foods
    return @favorite_foods
  end

  def age= (new_age)
    @age = new_age
  end

  def favorite_food?(food)
    @favorite_foods.map(&:downcase).include?(food.downcase)
  end
end

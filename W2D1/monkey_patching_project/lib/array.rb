# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.empty?
    return self.max - self.min
  end

  def average
    return nil if self.empty?
    return self.sum / self.length.to_f
  end


  def median
    return nil if self.empty?
    return self.sort[self.length / 2] if self.length % 2 != 0
    return self.sort[self.length / 2 - 1..self.length / 2].sum / 2.0
  end


  def counts
    hash = Hash.new(0)

    self.each do |ele|
      hash[ele] += 1
    end

    return hash
  end


  def my_count(val) # return the number of times that value appears in the array
    count = 0
    self.each { |ele| count += 1 if ele == val}

    return count 
  end


  def my_index(val)
    self.each_with_index { |ele, i| return i if val == ele} 
    return nil
  end

  
  def my_uniq
    array = []
    self.each do |ele|
      if !array.include?(ele)
        array << ele
      end
    end

    return array
  end


  def my_transpose
    outer_array = []

    self.each_with_index do |ele_1, i|
      array = []
      self[i].each_with_index do |ele_2, j|
        array << self[j][i]
      end
        outer_array << array
    end

    return outer_array
  end

end



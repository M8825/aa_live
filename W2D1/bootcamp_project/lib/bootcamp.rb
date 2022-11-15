require 'byebug'
class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |h, k| h[k] = [] }
  end


  def name
    return @name
  end

  
  def slogan
    return @slogan
  end


  def teachers
    return @teachers
  end


  def students
    return @students
  end


  def hire(teacher)
    @teachers.push(teacher)
  end


  def enroll(student)
    if @student_capacity > @students.length
      @students.push(student) 
      return true
    else
      return false
    end
  end

  def enrolled?(student)
    return @students.include?(student)
  end


  # def student_to_teacher_ratio
  #   # return @students.length / @teachers.length
  # end
  def student_to_teacher_ratio
    return @students.length / @teachers.length
  end

  def add_grade(student, grade)
    if @students.include?(student)
      @grades[student].push(grade)
      return true
    else
      return false
    end
  end


  def num_grades(student)
    return @grades[student].length
  end


  def average_grade(student)
    if @grades[student].sum > 0
      return @grades[student].sum / @grades[student].length 
    end

    return nil if !@students.include?(student)
  end
  
end





require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees
  
  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    @salaries.has_key?(title)
  end


  def >(startup)
    @funding > startup.funding
  end


  def hire(employee_name, title)
    if @salaries[title]
      @employees << Employee.new(employee_name, title)
    else
      raise "Invalid title"
    end
  end


  def size
    @employees.length
  end


  def pay_employee(e)
    amount = @salaries[e.title]
    if @funding - amount >= 0 
        e.pay(amount)
        @funding -= amount 
    else 
        raise 
    end
  end


  def payday
      @employees.each {|employee| pay_employee(employee) }
  end

  def average_salary
    money = []
    @employees.each { |employee| money << @salaries[employee.title]}
    money.sum / size
  end


  def close
    @employees = []
    @funding = 0
  end

  
  def acquire(other_startup)
    @funding += other_startup.funding

    other_startup.salaries.each { |title, pay| @salaries[title] = pay unless @salaries.has_key?(title)}
    @employees += other_startup.employees
    other_startup.close
  end
end

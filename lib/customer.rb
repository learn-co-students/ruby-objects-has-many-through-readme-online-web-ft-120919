class Customer
  attr_accessor :name, :age
  @meals = []
  @@all = []
  
  def initialize(name, age)
    @name = name 
    @age = age 
    @@all << self
  end
  
  def new_meal(waiter, total, tip)
    order = Meal.new(waiter, self, total, tip)
  end
  
  def meals
    Meal.all.select {|meal| meal.customer == self}
  end
  
  def waiters
    waiters = self.meals.collect {|meal| meal.waiter}
    waiters.uniq
  end
  
  def self.all
    @@all
  end
end
class Waiter
  attr_accessor :name, :experience
  
  @@all = []
  
  def initialize(name, experience)
    @name = name
    @experience = experience
    @@all << self
  end 
  
  def new_meal(customer, total, tip)
    order = Meal.new(self, customer, total, tip)
  end
  
  def meals
    Meal.all.select {|meal| meal.waiter == self}
  end
  
  def best_tipper
    best_tip = self.meals.reduce {|memo, meal| meal.tip > memo.tip ? meal : memo}
    best_tip.customer
  end
    
  def self.all
    @@all
  end
end
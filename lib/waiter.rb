class Waiter
  attr_reader :name, :years
  @@all = []
  def initialize(name, years)
    @name = name
    @years = years
    @@all << self
  end
  def self.all
    @@all
  end
  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end
  def meals
    Meal.all.select{|meal|meal.waiter == self}
  end
  def best_tipper
    tip = 0
    customer = nil
    Meal.all.each do |meal|
      if meal.tip > tip
        tip, customer =meal.tip, meal.customer
      end
    end
    customer
  end
end

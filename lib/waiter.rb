class Waiter

    attr_accessor :name, :yrs_experience
  
    @@all = []
  
    def initialize(name, yrs_experience)
      @name = name
      @yrs_experience = yrs_experience
      @@all << self
    end
  
    def self.all
      @@all
    end

    def new_meal(customer, total, tip=0)
      Meal.new(self, customer, total, tip)
    end #new_meal

    def meals
      Meal.all.select{|meal| meal.waiter == self}
    end #meals 

    def best_tipper
      meals.sort_by{|meal| meal.tip}.reverse[0].customer 
    end #best_tipper 
  
  end
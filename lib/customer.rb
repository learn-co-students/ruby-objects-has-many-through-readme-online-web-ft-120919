class Customer
    attr_accessor :name, :age

    @all = [] #the customer class should know of every customer instance. 

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end #rachel = Customer.new("Rachel", 27)

    def self.all
        @@all
    end

    def new_meal(waiter, total, tip=0)
        Meal.new(waiter, self, total, tip) #don't need to take a customer in as an argument b/c we are passing ourself
    end #rachel.new_meal(dan, 50, 10)

    def meals #customer will look at all of the meals & select the ones that belong to them
        Meal.all.select do |meal|
            meal.customer == self
        end
    end #call like -> rachel.meals #rachel.meals.length

    def waiters
        meals.map do |meal|
            meal.waiter
        end
    end #rachel.waiters  # rachel.waiters.length #rachel.waiters.last.name
  
    def new_meal(waiter, total, tip=0)
        Meal.new(waiter, self, total, tip)
    end

    def new_meal_20_percent(waiter, total)
        tip = total * 0.2
        Meal.new(waiter, self, total, tip)
    end

    def self.oldest_customer
        oldest_age = 0
        oldest_customer = nil
        self.all.each do |customer|
            if customer.age > oldest_age
                oldest_age = customer.age
                oldest_customer = customer
            end
        end
        oldest_customer
    end
end
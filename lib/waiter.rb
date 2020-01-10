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
        Meal.new(self, customer, total, tip) #don't need to take a waiter in as an argument b/c we are passing ourself
    end #dan.new_meal(rachel, 50, 10)

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|
            meal_a.tip <=> meal_b.tip
        end
        best_tipped_meal.customer
    end # waiter.best_tipper OR waiter.best_tipper.name

    def most_frequent_customer #waiter's most frequent customer
    end

    def meal_of_worst_tipped_customer #meal of worst tipping customer
        worst_tipped_meal = meals.max do |meal_a, meal_b|
            meal_b.tip <=> meal_a.tip
        end
        worst_tipped_meal.customer.meal
    end

    def average_tips # average tips of most and least experienced customer
    end


end
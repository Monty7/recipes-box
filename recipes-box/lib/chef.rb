class Chef 
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.create_two_chefs 
    montensia = Chef.new("Montensia")
    chris = Chef.new("Chris")
  end
  
  def recipes 
    #Look through all the recipes and return an array of JUST THE RECIPE INSTANCES that have this instance of a chef as the chef attribute
    Recipe.all.find_all do |recipe|
      recipe.chef == self
    end
  end
  
end
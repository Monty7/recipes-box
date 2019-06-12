class Recipe
  attr_accessor :title, :url
  
  @@all = []
  
  def initialize(title, url)
    @title = title
    @url = url
    @@all << self
  end
  
  def self.create_recipes(recipes_array)
    #recipe_data = Scraper.get_page
    recipes_array.each do |recipe|
   
      Recipe.new(recipe[:title], recipe[:url])
    end
  end
  
  def self.get_recipe_titles
    
    recipe_data = Scraper.get_page
    
    self.create_recipes(recipe_data)
      binding.pry
      
    # counter = 0
    # recipe_list = []
    # self.get_page.each do |key, value|
    #   counter += 1
    #   recipe_list << [counter, value[:title]]
  
    #   puts "#{counter}. #{value[:title]}"
    # end
    # recipe_list
  # binding.pry
  end
  
  def all
    @all
  end
end
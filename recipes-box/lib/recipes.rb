class Recipe
  attr_accessor :title, :url, :num
  
  @@all = []
  
  def initialize(title, url, num = 0)
    @title = title
    @url = url
    @num = num
    @@all << self
  end
  
  def self.create_recipes(recipes_array)
    #recipe_data = Scraper.get_page
    recipes_array.each_with_index do |recipe, index|
 # binding.pry
      Recipe.new(recipe[:title], recipe[:url], index + 1)
    end
  end
  
  def self.get_recipe_titles
    
    recipe_data = Scraper.get_page
    
    self.create_recipes(recipe_data)
   
     
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
  
  # def add_number_attribute
  #   all.each_with_index do |x, y|
  #     binding.pry
  #   end
  # end
  def self.display_recipe_list
    self.get_recipe_titles
    all.each do |recipe|
      puts "#{recipe.num}. #{recipe.title}"
      #binding.pry
    end
  end
  
  def self.all
    @@all
  end
end
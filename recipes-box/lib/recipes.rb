class Recipe
  
  attr_accessor :title, :url, :num, :chef
  
  @@all = []
  
  def initialize(title, url, chef, num = 0)
    @title = title
    @url = url
    @chef = chef
    @num = num
    @@all << self
  end
  
  def self.create_recipes(recipes_array)
    recipes_array.each_with_index do |recipe, index|
      chef = Chef.all.sample
      Recipe.new(recipe[:title], recipe[:url], chef, index + 1)
    end
  end
  
  #def change_chef(chef)
  #  self.chef = chef
  #end
  #setter method, uses attr_accessor
  
  def self.get_recipe_titles
    recipe_data = Scraper.get_page
    self.create_recipes(recipe_data)
  end

  def self.all
    @@all
  end
end
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
      recipes_array.each_with_index do |recipe, index|
      Recipe.new(recipe[:title], recipe[:url], index + 1)
    end
  end
  
  def self.get_recipe_titles
    recipe_data = Scraper.get_page
    self.create_recipes(recipe_data)
  end
  
  def self.test(title)
    title
  end

  def self.all
    @@all
  end
end
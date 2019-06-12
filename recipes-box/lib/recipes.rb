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
  end
  
  # def renumber_attribute
  #   all.each_with_index do |x, y|
  #     binding.pry
  #   end
  # end
  def self.display_recipe_list
    self.get_recipe_titles
    all.each do |recipe|
      puts "#{recipe.num}. #{recipe.title}"
    end
    self.recipe_selection
  end
  
  def self.recipe_selection
    puts "Select a recipe number:"
    selected_num
  end
  
  def self.selected_num
    input = gets.chomp.downcase.to_i
    self.dislay_selection(input)
  end
  
  def self.dislay_selection(selection_num)
    selected_recipe = nil
    all.each do |recipe|
    #  binding.pry
      if selection_num == recipe.num
        puts "You selected: #{recipe.title}."
        selected_recipe = recipe
      end
    end
    
   # binding.pry
     selected_recipe
  end
  
  def recipe_selected_title
    
  end

  
  def add_recipe_in_box?
    puts "Would you like to add this recipe to your recipe box?"
    puts "Enter 'Y' for Yes or 'N' for No:" 
    input = gets.chomp.downcase
    case 'input'
      when 'y'
        #push to instance box
       # Recipes.select_recipe()
      when 'n'
        
        
    end
  end
  
  def self.all
    @@all
  end
end
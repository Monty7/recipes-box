class CLI
  
  
  attr_accessor :user, :box, :select_title
  def initialize(user = "guest")
     @user = user
    @box = []
    
  end
  
  def run 
    puts "Enter your name"
    @user = gets.chomp
    puts "Welcome, #{user}!"
  
    menu 
    goodbye
  end
    
  def list_recipes
   
     #List out the recipes from Scrap
     Recipe.get_recipe_titles
     puts "Enter a number for a recipe:"
     input = gets.chomp.downcase
     #binding.pry
     Scraper.select_title(input)
    # @box << Scraper.add_recipe(recipe)
  end
  
  # def add_recipe(recipe)
  #   puts "hey!"
  #   binding.pry
  # # @box << recipe
  # end
  
  def menu
    puts "Type 'list' to pick a recipe or type exit to leave."
    input = nil
    while input != "exit"
      
      input = gets.chomp.downcase
      case input
        when "list"
          Recipe.display_recipe_list
        when "exit"
          puts "exit"
        else
          puts "Type 'list' or 'exit'."
      end
    end
    #shovel selected recipes into @box user's instance
  end
  
  def goodbye
    puts "Thank You, Goodbye!"
    
  end

end
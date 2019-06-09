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
     Scraper.get_recipe_titles
     puts "Enter a number for a recipe:"
     input = gets.chomp.downcase
     
     Scraper.select_title(input)
  end
  
  def menu
    puts "Type 'list' to pick a recipe or type exit to leave."
    input = nil
    while input != "exit"
      
      input = gets.chomp.downcase
      case input
        when "list"
          list_recipes
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
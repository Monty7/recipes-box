class CLI 
  attr_accessor :user
  def initialize(user = "guest")
     @user = user
    @box = []
  end
  
  def run 
    puts "Enter your name"
    @user = gets.chomp
    list_recipes
    menu 
    goodbye
  end
    
  def list_recipes
    puts "Welcome, #{user}!"
     #List out the recipes from Scrap
     Scraper.get_page
  end
  
  def menu
    
    input = nil
    while input != "exit"
      puts "Enter a number for a recipe, or 'list' to see the menu, or type exit to leave."
      input = gets.chomp.downcase
      case input
        when "1"
          puts "One"
        when "2"
          puts "Two"
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
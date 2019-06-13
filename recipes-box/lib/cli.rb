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
  
  
  def menu
    puts "Type 'list' to pick a recipe, type 'box' to display a list of your added recipes, or type 'exit' to leave."
     input = nil
    while input != "exit"
      input = gets.chomp.downcase
     
      case input
        when "list"
          display_recipe_list

        when "box"
          display_user_box
        else
          puts "Type 'list' or 'exit'."
      end
    end
    goodbye

  end
  
  def display_recipe_list
    Recipe.get_recipe_titles
    Recipe.all.each do |recipe|
      puts "#{recipe.num}. #{recipe.title}"
    end
    recipe_selection
  end  
  
  def recipe_selection
    puts "Select a recipe number:"
    print ">> "
    selected_num
  end
  
  def selected_num
    input = nil
    input = gets.chomp.downcase.to_i
    display_selection(input)
  end
  
  def display_selection(selection_num)
    selected_recipe = nil
    Recipe.all.each do |recipe|
    #  binding.pry
      if selection_num == recipe.num
        puts "You selected: #{recipe.title}."
        selected_recipe = recipe
      end
    end
     add_recipe_in_box?(selected_recipe)
  end
  
  def add_recipe_in_box?(selection)
    input = nil
      puts "Would you like to add this recipe to your recipe box?"
      puts "Enter 'Y' for Yes or 'N' for No:" 
      print ">> "
      input = gets.chomp.downcase
      if input == 'y'
        
          #push to instance box
        @box << selection
        display_user_box
      elsif 'n' == input
          display_user_box
        else
          menu
        
    end
  end
  
  def display_user_box
#binding.pry
    
    if @box.empty?
      puts "There is nothing in your recipe box."
      menu
    else
      
      @box.each.with_index(1) do |recipe, index|
        puts "#{index}. #{recipe.title}"
      end
      puts "Select a number to display the recipe ingredients and directions or type 'menu' to go back to the menu:"
      prompt = ">> "
      print prompt
      
      while input = gets.chomp.to_i
        #  binding.pry
       # case input
         if input <= @box.size
            puts @box[input - 1].url
            break
          
          else
            puts "Enter a vaild number that is listed in your recipe box:"
            print prompt
            
        #binding.pry
        end
      end
    end
  end
  
  def goodbye
    puts "Thank You, Goodbye!"
    
  end

end
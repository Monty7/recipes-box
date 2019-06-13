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
  
  def menu
    puts "Type 'list' to pick a recipe, type 'box' to display a list of your added recipes, or type 'exit' to leave."
     input = gets.chomp.downcase
        if input == "list"
          display_recipe_list
        elsif input == "box"
          display_user_box
        elsif input == "exit"
           goodbye
        else
          puts "Enter a valid selection"
      end

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
    input = gets.chomp.downcase.to_i
    display_selection(input)
  end
  
  def display_selection(selection_num)
    selected_recipe = nil
    Recipe.all.each do |recipe|
    #  binding.pry
      if selection_num == recipe.num
        puts "You selected: #{recipe.title}." #NEEDS DEBUGGING - PUTS repeats here
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
      print ">> "
      next_decision
  
    end
  end
  
  def next_decision 
   box_input = gets.chomp.downcase
       if box_input == 'menu'
          menu
       elsif box_input.to_i <= @box.size
        puts @box[box_input.to_i - 1].url
       else
        puts "Enter a vaild number that is listed in your recipe box:"
        print ">>"
        next_decision
      end
  end
  
  def goodbye
    puts "Thank You, Goodbye!"
  
  end

end
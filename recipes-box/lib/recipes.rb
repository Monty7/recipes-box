module Recipes
  module ClassMethods
   def get_recipe_titles
      counter = 0
      recipe_list = []
      self.get_page.each do |key, value|
        counter += 1
        recipe_list << [counter, value[:title]]
    
        puts "#{counter}. #{value[:title]}"
      end
      recipe_list
     # binding.pry
    end
  
    # def self.add_recipe
    #   select_title
    # end
    
     def select_title(num)
       selected_title = ""
       get_recipe_titles.each do |title|
        
        if title[0] == num.to_i
          puts title
          puts "Do you want to add this recipe to your recipe box list? 'Y' or 'N' "
          input = gets.chomp.downcase 
          case input
            when 'y'
             
              selected_title = title[1]
              @box << selected_title
              
              #binding.pry
              #all_user_recipes(title)
             # CLI.add_recipe(selected_title)
            end
       end
      end
      selected_title
     end
  end
end
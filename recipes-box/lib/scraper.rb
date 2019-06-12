# require 'nokogiri'
# require 'open-uri'
class Scraper 
  attr_accessor :get_recipe_titles, :select_title, :CLI, :box
  
  def self.get_page
   page = open("https://www.connoisseurusveg.com/recipe-index/")
   recipes = []
    doc = Nokogiri::HTML(page)
   
    titles = doc.css('.entry-title a')
  
    titles.each do |title|
     
      title_txt = title.text
      url = title.attr('href')
  
      recipes << {:title => title_txt, :url => url}
                      
    end
    recipes
  end
  




  # def self.add_recipe
  #   select_title
  # end
  
  def self.select_title(num)
    selected_title = ""
    get_recipe_titles.each do |title|
      
      if title[0] == num.to_i
        puts title
        puts "Do you want to add this recipe to your recipe box list? 'Y' or 'N' "
        input = gets.chomp.downcase 
        case input
          when 'y'
            binding.pry
            selected_title = title[1]
            #@box << selected_title
            
            #binding.pry
            #all_user_recipes(title)
          # CLI.add_recipe(selected_title)
          end
    end
    end
    selected_title
  end
   
 
end

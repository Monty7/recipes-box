# require 'nokogiri'
# require 'open-uri'
class Scraper 
  attr_accessor :get_recipe_titles, :select_title, :all_user_recipes
  
  def self.get_page
   page = open("https://www.connoisseurusveg.com/recipe-index/")
   recipes = {}
     page = open("https://www.connoisseurusveg.com/recipe-index/")
    # sleep 5
    doc = Nokogiri::HTML(page)
   
    titles = doc.css('.entry-title a')
  
    titles.each do |title|
     
      title_txt = title.text.to_sym
      url = title.attr('href')
  
      recipes[title_txt] = {:title => title_txt, :url => url}
                      
    end
   
    recipes
  end
  


  def self.get_recipe_titles
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

  
   def self.select_title(num)
     
     get_recipe_titles.each do |title|
      
      if title[0] == num.to_i
        puts title
        puts "Do you want to add to this recipe to your recipe box list? 'Y' or 'N' "
        input = gets.chomp.downcase 
        case input
          when 'y'
            #binding.pry
            all_user_recipes(title)
          end
      
     end
    end
   end
   
   def all_user_recipes(title)
     self.box << title
   end
end

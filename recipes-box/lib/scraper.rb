# require 'nokogiri'
# require 'open-uri'
class Scraper 
  attr_accessor :get_recipe_titles, :select_title
  
  def self.get_page
   page = open("https://www.connoisseurusveg.com/recipe-index/")
   recipes = {}
     page = open("https://www.connoisseurusveg.com/recipe-index/")
    # sleep 5
    doc = Nokogiri::HTML(page)
   
    titles = doc.css('.entry-title a')
    counter = 0
    titles.each do |title|
     
      title_txt = title.text.to_sym
      url = title.attr('href')
      counter += 1
      recipes[title_txt] = {:num => counter, :title => title_txt, :url => url}
                      
    end
   
    recipes
  end
  


  def self.get_recipe_titles
    
    recipe_list = []
    self.get_page.each do |key, value|
   #binding.pry
  
   recipe_list << value[:title]
    puts "#{value[:num]}. #{value[:title]}"
    end
    recipe_list
   
  end
  #self.get_recipe_title
  
   def select_title(num)
     binding.pry
     get_recipe_titles.each_with_index do |title, index|
       
       if num == index + l
         puts "Do you want to add to your recipe box list? 'Y' or 'N' "
         input = gets.chomp.downcase 
         case input
          when 'y'
            binding.pry
            self.box << title
          end
       end
     end
   
   end
end

# require 'nokogiri'
# require 'open-uri'
class Scraper 
  attr_accessor :recipe_titles
  
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
    self.get_page.each do |key, value|
   # binding.pry
   counter += 1
    puts "#{counter}. #{key}"
    end
  end
  #self.get_recipe_title
end

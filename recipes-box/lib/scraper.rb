# require 'nokogiri'
# require 'open-uri'
class Scraper 
  attr_accessor :get_recipe_titles
  
  def self.get_page
   page = open("https://www.connoisseurusveg.com/recipe-index/")
   doc = Nokogiri::HTML(page)
   
   recipes = []
   
    titles = doc.css('.entry-title a')
    titles.each do |title|
      title_txt = title.text
      url = title.attr('href')
      recipes << {:title => title_txt, :url => url}
    end
    recipes
  end
  
   
 
end

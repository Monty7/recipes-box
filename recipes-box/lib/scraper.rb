class Scraper 
  attr_accessor :recipe_titles
  
  def self.get_page 
  #  page = open("https://www.connoisseurusveg.com/recipe-index/")
  recipes = {}
    page = open("https://www.connoisseurusveg.com/recipe-index/")
    sleep 5
    doc = Nokogiri::HTML(page)
   
    titles = doc.css('.entry-title a')

    titles.each do |title|
     
      title_txt = title.text.to_sym
      url = title.attr('href')
      recipes[title_txt] =  {:url => url}
  
    end
    recipes
  end

  def get_recipe_title
    self.get_page
   # binding.pry
  end
  binding.pry
end
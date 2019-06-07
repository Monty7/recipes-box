class Scraper 
  attr_accessor :recipe_titles
  def self.get_page 
  #  page = open("https://www.connoisseurusveg.com/recipe-index/")
  @recipe_titles = {}
    page = open("https://sweetpotatosoul.com/recipes")
    sleep 5
    doc = Nokogiri::HTML(page)
    titles = doc.css('.recipe h4 a')
      
    titles.each do |title|
      binding.pry
      
     # :recipe_titles[title] = {:url = title.attr('href')}
      
    end
    #binding.pry
  end
  
end
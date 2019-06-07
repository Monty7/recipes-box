class Scraper 
  
  def self.get_page 
  #  page = open("https://www.connoisseurusveg.com/recipe-index/")
    page = open("https://sweetpotatosoul.com/recipes")
    sleep 5
    doc = Nokogiri::HTML(page)
    elements = doc.css()
   # elements = doc.css(".entry-header .entry-title a")
    binding.pry #how do i use pry without 'learn'
  end
  
end
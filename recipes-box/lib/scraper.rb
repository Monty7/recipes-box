class Scraper 
  
  def self.get_page
    page = open("https://www.connoisseurusveg.com/recipe-index/")
    doc = Nokogiri::HTML(page)
   
    titles = doc.css('.entry-title a')
    
    recipes = titles.collect do |title|
      {:title => title.text, :url => title.attr('href')}
    end
  end
end

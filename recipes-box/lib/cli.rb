class CLI 
  
  def initialize
    @user = nil
    @box = []
  end
  
  def run 
    Scraper.get_page
    puts "Enter your name"
    @user = gets.chomp
  end
    
    

end
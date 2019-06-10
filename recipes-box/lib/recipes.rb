class Recipe
  attr_accessor :title, :url
  
  @@all = []
  
  def initialize(title, url)
    @title = title
    @url = url
  end
  
  def all
    @all
  end
end
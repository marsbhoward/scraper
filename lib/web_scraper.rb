require 'nokogiri'
require 'open-uri'




class WebScraper

  def get_site
    site = "https://www.timeout.com/newyork/restaurants/100-best-new-york-restaurants"
    Nokogiri::HTML(open(site))
  end

  def get_taget_info
    self.get_site.css("h3")
  end


  def get_data
    restaurantList = []
    #doc =Nokogiri::HTML(open("https://collider.com/best-movies-on-netflix-streaming/")).css("script")[23]
    
    #targets a block of html for each restaurant based on timeout's css
    doc1 = self.get_taget_info
    doc1.shift()
    #iterates through each block to filter out the name of the restaurant
    doc1.each { |block|
    block = block.to_s
    block = block.partition('decoration-none">').last
    #block = block.split(' ')
    restaurantName = block.partition('</a>').first
    #restaurantName.slice!(0)
    restaurantList.push (restaurantName)  
    puts restaurantName
    }

    #puts doc1
  end
 end


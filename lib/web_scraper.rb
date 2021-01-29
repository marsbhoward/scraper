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
    restaurantName = block.partition('</a>').first
    #if restaurantName begins with number removes number from title
    #else removes spacing from site formatting

    if restaurantName[/\d/] != nil
      restaurantName = restaurantName.partition('.').last
    else
      restaurantName = restaurantName.partition('                   ').last
    end
    if restaurantName.include?("&amp")
      restaurantName.sub! '&amp;', ' & '
    end
    restaurantList.push (restaurantName)  
    }
    puts restaurantList

  end
 end


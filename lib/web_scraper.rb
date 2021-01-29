require 'nokogiri'
require 'open-uri'




class WebScraper

  def get_site
    site = "https://www.timeout.com/newyork/restaurants/100-best-new-york-restaurants"
    Nokogiri::HTML(open(site))
  end

  def get_name_info
    self.get_site.css("h3")
  end

  def get_location_info
    self.get_site.xpath("//*[@class=\"list_feature__tag_item card-location xs-text-8 xs-line-height-8 xs-bold xs-mr1\"]")
  end

  def get_data
    restaurantList = []
    #targets a block of html for each restaurant based on timeout's css
    doc1 = self.get_name_info
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


    locationList = []
    x = 0
    doc2 = self.get_location_info
    doc2.each { |block|
      if x == 0
        x =x +1
        next
      end 
      block = block.to_s
      block = block.partition('xs-mr1">').last
      block = block.partition('                    ').last
      block = block.partition('</span>').first
      location = block      
      locationList.push (location)
    }

    puts restaurantList
    puts locationList

  end
 end


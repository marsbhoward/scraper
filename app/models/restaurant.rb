class Restaurant < ApplicationRecord

	validates_uniqueness_of :name, scope: :location
  
  
  def self.all
    ObjectSpace.each_object(self).to_a
  end 
  
  def self.display
	 puts self.list
  end
  
  def self.list
	  Restaurant.all.each do |restaurant|
      puts restaurant.name
      puts restaurant.location
      puts restaurant.description
    end
  end
end

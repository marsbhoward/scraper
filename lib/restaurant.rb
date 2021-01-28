class Restaurant

	attr_accessor :name
	attr_accessor :location
	attr_accessor :description

@@all = []
	@@list = []

  def initialize(name)
    @name = name
    @movies = []
  end
  
  def self.list_all(name)
	 Movie.all.each do |movie|
			

		 if movie.stream == name
			
			self.list << movie.stream
		
		 end
		end
	end
  
  def self.all
    @@all
  end
  
  def self.display
	puts self.list
  end
  
  def self.list
	@@list
  end
	
  def self.list_clear
    @@list.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    stream = new(name)
    stream.save
    stream
  end

  def add_movie(movie)
    movie.stream = self unless movie.stream
    movies << movie unless moviess.include?(movie)
  end
	

end
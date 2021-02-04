class CommandLineInterface

	def call
		puts "Lists of Timeout Restaurants"
		puts""
		WebScraper.new.get_data
		puts Restaurant.all.count
	end
end
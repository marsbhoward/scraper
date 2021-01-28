class CommandLineInterface

	def call
		puts ""
		puts "Hello, and welcome"
		puts""
		WebScraper.new.get_data
	end
end
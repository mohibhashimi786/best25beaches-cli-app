#CLI controller
class Best25Beaches::CLI

	def call
		puts "top beaches"
		menu
		exit
	end

	
	def menu



	end



	def exit
		Best25Beaches::Scraper.new.create_beach
		"Please come backs soon"
	end

end

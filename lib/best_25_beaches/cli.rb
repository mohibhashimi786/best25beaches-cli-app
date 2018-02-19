#CLI controller
class Best25Beaches::CLI

	def call
		Best25Beaches::Scraper.new.create_beach
		puts "top beaches"
		menu
		exit
	end

	
	def menu
		Best25Beaches::Beach.all.each.with_index(1) do |a,b|
			puts "#{b}... #{a.location}...#{a.description}"
		end


	end



	def exit
		Best25Beaches::Scraper.new.create_beach
		"Please come backs soon"
	end

end

#CLI controller
class Best25Beaches::CLI

	def call
	Best25Beaches::Scraper.new.create_beach
	menu
		
	end

	
	def menu
		Best25Beaches::Beach.all.each.with_index(1) do |a,b|
			puts "#{b}... #{a.name}...#{a.description}"
		end


	end



	def exit

		"Please come backs soon"
	end

end

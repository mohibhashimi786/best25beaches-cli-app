#CLI controller
class Best25Beaches::CLI

	


	def call
	Best25Beaches::Scraper.run
	menu
		
	end


	
	def menu
		Best25Beaches::Beach.all.each.with_index do |a,b|
			


					puts "#{b+1}... #{a.name}...#{a.hotels}..#{a.restaurants}..#{a.nearby_attractions}"
				end	
	end



	def exit
		"Please come backs soon"
	end

end
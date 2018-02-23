#CLI controller
class Best25Beaches::CLI

	


	def call
	Best25Beaches::Scraper.run
	menu
		
	end


	
	def menu
		puts "Welcome to the first step of your dream destination vacation!"
		puts "Here are the top 25 best beach destinations in the world:"
		Best25Beaches::Beach.all.each.with_index do |a,b|
		puts "#{b+1}. #{a.name}"
		end	
	end



	def exit
		"Please come backs soon"
	end

end
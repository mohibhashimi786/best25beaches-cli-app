#CLI controller
class Best25Beaches::CLI

	def call
	Best25Beaches::Scraper.run
	menu
	exit
	end

	def menu
		input = ""
			while input != 'exit'
			puts "Welcome to the first step of your dream destination vacation!"
			puts "Here are the top 25 best beach destinations in the world:"
				Best25Beaches::Beach.all.each.with_index do |a,b|
					puts "			#{b+1}. #{a.name}"
				end
			puts "Please enter the number of the beach you would like  more information on or type 'exit' to leave the program."
			input = gets.strip
			end
			Best25Beaches::Beach.locate(input.to_i)	
	end

	def exit
		puts "Please come backs soon, Goodbye :-)"
	end

end
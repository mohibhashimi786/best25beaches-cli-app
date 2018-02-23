#CLI controller
class Best25Beaches::CLI

	def call
	Best25Beaches::Scraper.run
	menu
	exit
	end

	def list
		Best25Beaches::Beach.all.each.with_index do |a,b|
			puts "			#{b+1}. #{a.name}"
		end
	end


	def menu
		
			puts "Welcome to the first step of your dream destination vacation!"
			puts "Here are the top 25 best beach destinations in the world:"
			list
			input = nil
			until input == 'exit'
			puts "Please enter the number of the beach you would like more information on or type 'exit' to leave the program."
			
				input = gets.strip
				if input == 'list'
					list
				elsif input.to_i > 0

					if beach = Best25Beaches::Beach.locate(input.to_i)
					print_beach(beach)
						input1 = nil
						until input1 == 'exit' || input1 == 'hotels' || input1 == 'restaurants' || input1 == 'attractions' || input1 == 'menu'
						puts "For nearby hotels, please enter 'hotels, for nearby restaurants, please 'restaurants, and for nearby attractions, please type 'attractions."
						puts "If you would like information on another beach, please type 'menu' or type 'exit' to leave the program."
					end
					end
				end

			end
	end

	def print_beach(beach)
		puts "**********************#{beach.name}**********************"
		puts "**********************#{beach.location}**********************"
		puts "***********#{beach.description}***********"
	end

	def exit
		puts "Please come backs soon, Goodbye :-)"
	end

end
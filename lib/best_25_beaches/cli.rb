#CLI controller
require 'colorize'
class Best25Beaches::CLI


	def call
	Best25Beaches::Scraper.run
	menu
	
	end

	def list
		puts "Welcome to the first step of your dream destination vacation!"
			puts "Here are the top 25 best beach destinations in the world:"
		Best25Beaches::Beach.all.each.with_index do |a,b|
			puts ("                 #{b+1}. #{a.name}").colorize(:light_blue)
		end
	end


	def menu
			list
			puts "Please enter the number of the beach you would like more information on or type 'exit' to leave the program."
			input = nil
				input = gets.strip
				if input == 'exit'
					exit
				elsif input.to_i.between?(1, 26)
					if beach = Best25Beaches::Beach.locate(input.to_i)
						print_beach(beach) 
					else
						menu
					end
				else
					menu
				end

	end

	def print_beach(beach)
		input1 = ""
		until input1 == 'exit' || input1 == 'hotels' || input1 == 'restaurants' || input1 == 'attractions' || input1 == 'menu'
			puts ("NAME:  #{beach.name.upcase}".center(50, "-")).colorize(:light_blue)
			puts ("LOCATION:  #{beach.location}".center(50, "-")).colorize(:light_blue ).colorize( :background => :yellow)
			puts ("DESCRIPTION:  #{beach.description}".center(50, "-")).colorize(:light_blue ).colorize( :background => :yellow)
			puts ("BEACH RATING: #{beach.rating}".center(50, "-")).colorize(:light_blue ).colorize( :background => :yellow)
			puts ("BEACH ACTIVITIES: #{beach.activities}".center(50, "-")).colorize(:light_blue ).colorize( :background => :yellow)
			puts ("EXCELLENT REVIEW PERCENTAGE:  #{beach.excellent_review_percentage}".center(50, "-")).colorize(:light_blue ).colorize( :background => :yellow)
			puts "___________________________________________________________________".colorize(:yellow)
			puts ""
			puts "For nearby hotels, please enter 'hotels, for nearby restaurants, please type 'restaurants, and for nearby attractions, please type 'attractions.".colorize(:green)
			puts "If you would like information on another beach, please type 'menu' or type 'exit' to leave the program.".colorize(:green)
			puts ""
			input1 = gets.strip
				case input1
					when "exit"
						exit
					when 'menu'
						menu
					when "hotels"
							puts ""
							puts "Hotels:".colorize(:light_blue)
						beach.hotels.each.with_index(1) do |hotel, index| 
							puts ("#{index}. #{hotel}").colorize(:green)
						 	end
						 	exit_or_restart
					when "restaurants"
							puts ""
							puts "Restaurants:".colorize(:light_blue)
						beach.restaurants.each.with_index(1) do |restaurant, index|
						 	puts ("#{index}. #{restaurant}").colorize(:green)
						    end
						    exit_or_restart
					when "attractions"
							puts ""
							puts "Attractions:".colorize(:light_blue)
						beach.nearby_attractions.each.with_index(1) do |attraction, index|
							puts ("#{index}. #{attraction}").colorize(:green)
							end
							exit_or_restart
				end
		end
		
	end

	def exit_or_restart
		puts "Would you like information on another beach? Enter 'Y' or 'N'"
		input2 = gets.strip.downcase	
    	if input2 == "y"
      		menu
    	else
			     puts ""
			     puts "Thank you! Have a great day!"
			    end
	end

	def exit
		puts "Please come back soon, Goodbye :-)"
	end

end
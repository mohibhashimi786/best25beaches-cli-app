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
			puts "			#{b+1}. #{a.name}"
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
			puts "NAME:  #{beach.name.upcase}".center(50, "-")
			puts "LOCATION:  #{beach.location}".center(50, "-")
			puts "DESCRIPTION:  #{beach.description}".center(50, "-")
			puts "BEACH RATING: #{beach.rating}".center(50, "-")
			puts "BEACH ACTIVITIES: #{beach.activities}".center(50, "-")
			puts "EXCELLENT REVIEW PERCENTAGE:  #{beach.excellent_review_percentage}".center(50, "-")
			puts ""
			puts ""
			puts "For nearby hotels, please enter 'hotels, for nearby restaurants, please 'restaurants, and for nearby attractions, please type 'attractions."
			puts "If you would like information on another beach, please type 'menu' or type 'exit' to leave the program."
			puts ""
			input1 = gets.strip
				case input1
					when "exit"
						exit
					when 'menu'
						menu
					when "hotels"
							puts "Hotels:"
						beach.hotels.each.with_index(1) do |hotel, index| 
							puts "#{index}. #{hotel}"
						 	end
					when "restaurants"
							puts "Restaurants:"
						beach.restaurants.each.with_index(1) do |restaurant, index|
						 	puts "#{index}. #{restaurant}"
						    end
					when "attractions"
							puts "Attractions:"
						beach.nearby_attractions.each.with_index(1) do |attraction, index|
							puts "#{index}. #{attraction}"
							end
				end
		end
		puts "Would you like information information on another beach? Enter 'Y' or 'N'"
			input2 = gets.strip.downcase
    		if input == "y"
      		start
    		else
      		puts ""
      		puts "Thank you! Have a great day!"
      		exit
      		end
    end    
		
	end

	def exit
		puts "Please come backs soon, Goodbye :-)"
	end

end
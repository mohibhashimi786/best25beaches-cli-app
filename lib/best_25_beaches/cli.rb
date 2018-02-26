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
				if input == 'list'
					list
				elsif input.to_i > 0
					beach = Best25Beaches::Beach.locate(input.to_i)
					print_beach(beach)
				else input == 'exit'
					exit
				end

	end

	def print_beach(beach)
		input1 = ""
		until input1 == 'exit' || input1 == 'hotels' || input1 == 'restaurants' || input1 == 'attractions' || input1 == 'menu'
			puts "**********************#{beach.name}**********************"
			puts "**********************#{beach.location}**********************"
			puts "***********#{beach.description}***********"
			puts "For nearby hotels, please enter 'hotels, for nearby restaurants, please 'restaurants, and for nearby attractions, please type 'attractions."
			puts "If you would like information on another beach, please type 'menu' or type 'exit' to leave the program."
			input1 = gets.strip
				case input1
					when "exit"
						exit
					when 'menu'
						menu
					when "hotels"
						puts "#{beach.hotels}".center(50, '_').colorize(:white)
					when "restaurants"
						puts "#{beach.restaurants}".center(50, '_').colorize(:light_blue)
					when "attractions"
						puts "#{beach.attractions}".center(50, '_').colorize(:light_blue)
				end
		end
	end

	def exit
		puts "Please come backs soon, Goodbye :-)"
	end

end
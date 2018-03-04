#CLI controller

class Best25Beaches::CLI

	#call method runs the scraper class to 'make available' all data, which can then be printed to the user in customized approaches.  Additionally, it starts interaction with user by means of the 'menu' method
	def call
	Best25Beaches::Scraper.run
	menu
	
	end

	#prints a list of the top 25 beaches for user.
	def list
		puts "___________________________________________________________________".colorize(:yellow)
		puts ""
		puts "Welcome to the first step of your dream destination vacation!"
			puts "Here are the top 25 best beach destinations in the world:"
			puts ""
			puts ""
		Best25Beaches::Beach.all.each.with_index do |a,b|
			puts ("                 #{b+1}. #{a.name}").colorize(:light_blue)
		end
		puts ""
		puts ""
	end

	#runs the list method and sets up conditionals to ensure user input is entered in a particular manner.  Additionally, allows user to obtain more information about a particular beach and/or to restart the menu or exit at any point
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

	#prints individualized information about a particular beach and setting up avenue for user to return back to menu to select an alternative beach.
	def print_beach(beach)
		input1 = ""
		until input1 == 'exit' || input1 == 'hotels' || input1 == 'restaurants' || input1 == 'attractions' || input1 == 'menu'
			puts "___________________________________________________________________".colorize(:yellow)
			puts ""
			puts "NAME:".colorize(:light_red) + "#{beach.name.upcase}".center(50, "-").colorize(:light_green)
			puts "LOCATION:".colorize(:light_red) + "#{beach.location}".center(50, "-").colorize(:light_green)
			puts "DESCRIPTION:".colorize(:light_red) + "  #{beach.description}".center(50, "-").colorize(:light_green)
			puts "BEACH RATING:".colorize(:light_red) + "#{beach.rating}".center(50, "-").colorize(:light_green)
			puts "BEACH ACTIVITIES:".colorize(:light_red) + "#{beach.activities}".center(50, "-").colorize(:light_green)
			puts "EXCELLENT REVIEW PERCENTAGE:".colorize(:light_red) + "#{beach.excellent_review_percentage}".center(50, "-").colorize(:light_green)
			puts "___________________________________________________________________".colorize(:yellow)
			puts ""
			puts "For nearby hotels, please enter 'hotels, for nearby restaurants, please type 'restaurants, and for nearby attractions, please type 'attractions.".colorize(:light_blue)
			puts ""
			puts "If you would like information on another beach, please type 'menu' or type 'exit' to leave the program.".colorize(:blue)
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
							puts ""
							beach.hotels.each.with_index(1) do |hotel, index| 
							puts ("#{index}. #{hotel}").colorize(:green)
						 	end
						 	exit_or_restart
					when "restaurants"
							puts ""
							puts "Restaurants:".colorize(:light_blue)
							puts ""
							beach.restaurants.each.with_index(1) do |restaurant, index|
						 	puts ("#{index}. #{restaurant}").colorize(:green)
						    end
						    exit_or_restart
					when "attractions"
							puts ""
							puts "Attractions:".colorize(:light_blue)
							puts ""
							beach.nearby_attractions.each.with_index(1) do |attraction, index|
							puts ("#{index}. #{attraction}").colorize(:green)
							end
							exit_or_restart
				end
		end
	end

	#allows user to exit the program or return to original menu listing all beaches for selection
	def exit_or_restart
		puts "___________________________________________________________________".colorize(:yellow)
		puts ""
		puts "Would you like information on another beach? Enter 'Y' or 'N'"
		input2 = gets.strip.downcase	
    	if input2 == "y"
      		menu
    	elsif input2 == "n"
			puts ""
			puts "Thank you! Have a great day!"  
		else
		    exit_or_restart
		end
	end

	#exits the program
	def exit
		puts "Please come back soon, Goodbye :-)"
	end

end
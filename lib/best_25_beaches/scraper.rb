class Best25Beaches::Scraper

	def get_page
		Nokogiri::HTML(open('https://www.tripadvisor.com/TravelersChoice-Beaches'))

	end

	

	def create_beach
		beaches = []
	    counter = 1
	    while counter < 25
	    beaches << self.get_page.xpath("//*[@id='TC_INNER#{counter}']/div[1]/div[2]/div[1]/a")
		counter+=1
		end
		beaches
		binding.pry
	end

	def create_index
		create_beach.each do |beach| Best25Beaches::Beach.create_from_index(beach)
			binding.pry
		end
	
	end

end

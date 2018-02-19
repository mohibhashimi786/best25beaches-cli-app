class Best25Beaches::Scraper

	def get_page
		Nokogiri::HTML(open('https://www.tripadvisor.com/TravelersChoice-Beaches'))

	end

	def scrape_index_page
		self.get_page.css('https://www.tripadvisor.com/TravelersChoice-Beaches')
	end

	def create_beach
		scrape_index_page.each do |beach|
			Best25Beaches::Beach.create_from_index(beach)
		end
	end


end

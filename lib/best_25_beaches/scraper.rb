class Best25Beaches::Scraper

	def get_page
		Nokogiri::HTML(open('https://www.tripadvisor.com/TravelersChoice-Beaches'))

	end

	def scrape_index_page
		self.get_page.xpath("//*[@id='TC_INNER1']/div[1]/div[2]/div[1]/a")

		binding.pry
	end

	def create_beach
		scrape_index_page.each do |beach|
			Best25Beaches::Beach.create_from_index(beach)
			
		end
	end


end

class Best25Beaches::Scraper

	def get_page
		Nokogiri::HTML(open('https://www.tripadvisor.com/TravelersChoice-Beaches'))

	end

	def scrape_names
		index_page = []
		i = 0
		while i < 25
		i+=1
		pages = self.get_page.xpath("//*[@id='TC_INNER#{i}']/div[1]/div[2]/div[1]/a").text
		index_page << pages
		end
		index_page.each do |beach| beach 
		binding.pry
	end

	def create_beach
		scrape_index_page.each do |beach|
			Best25Beaches::Beach.create_from_index(beach)
			binding.pry
			
		end
	end


end

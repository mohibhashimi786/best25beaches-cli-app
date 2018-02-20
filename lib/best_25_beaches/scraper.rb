class Best25Beaches::Scraper

	BEACHES = []

	def get_page
		Nokogiri::HTML(open('https://www.tripadvisor.com/TravelersChoice-Beaches'))

	end

	def index_of_beaches
	    counter = 1
	    while counter < 26
	    BEACHES << self.get_page.xpath("//*[@id='TC_INNER#{counter}']/div[1]/div[2]/div[1]/a")
		counter+=1
		end
		BEACHES

		
	end

	def create_beach
		
		self.index_of_beaches.flatten.each.with_index(1) do |beach_scrape, index| 
		new_beach = Best25Beaches::Beach.new
		new_beach.name = beach_scrape.text
		new_beach.location = beach_scrape.xpath("//*[@id='TC_INNER#{index}']/div[1]/div[2]/div[2]/a").text
		new_beach.description = beach_scrape.xpath("//*[@id='TC_INNER#{index}']/div[2]/div[1]/ul/li/div/text()").text
		new_beach.url = "https://www.tripadvisor.com" + beach_scrape.xpath("//*[@id='TC_INNER#{index}']/div[1]/div[2]/div[1]/a").attribute('href').value
		binding.pry
		end
		binding.pry
	end

end

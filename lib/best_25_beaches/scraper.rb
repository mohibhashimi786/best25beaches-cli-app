class Best25Beaches::Scraper

	BEACHES = []

	def get_page
		Nokogiri::HTML(open('https://www.tripadvisor.com/TravelersChoice-Beaches'))
	end

	def index_of_beaches
	    counter = 1
	    while counter <= 25
	    BEACHES << self.get_page.xpath("//*[@id='TC_INNER#{counter}']/div[1]/div[2]/div[1]/a")
		counter+=1
		end
		BEACHES
	end

	def create_beach
		self.index_of_beaches.flatten.each.with_index(1) do |beach_scrape, index| 
		name = beach_scrape.text
	    location = beach_scrape.xpath("//*[@id='TC_INNER#{index}']/div[1]/div[2]/div[2]/a").text
		description = beach_scrape.xpath("//*[@id='TC_INNER#{index}']/div[2]/div[1]/ul/li/div/text()").text
		url = "https://www.tripadvisor.com" + beach_scrape.xpath("//*[@id='TC_INNER#{index}']/div[1]/div[2]/div[1]/a").attribute('href').value
	    Best25Beaches::Beach.new(name, location, description, url)
		end
	end

end

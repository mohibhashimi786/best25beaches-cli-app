class Best25Beaches::Scraper

	BEACHES = []

	def self.run
     	create_beach
   	    webpage_scrape
   	    nearby
  	end

	def self.get_page
		Nokogiri::HTML(open('https://www.tripadvisor.com/TravelersChoice-Beaches'))
	end

	def self.index_of_beaches
	    counter = 1
		    while counter <= 25
		    BEACHES << get_page.xpath("//*[@id='TC_INNER#{counter}']/div[1]/div[2]/div[1]/a")
			counter+=1
			end
		BEACHES
	end

	def self.create_beach
		index_of_beaches.flatten.each.with_index(1) do |beach_scrape, index| 
			name = beach_scrape.text
		    location = beach_scrape.xpath("//*[@id='TC_INNER#{index}']/div[1]/div[2]/div[2]/a").text
			description = beach_scrape.xpath("//*[@id='TC_INNER#{index}']/div[2]/div[1]/ul/li/div/text()").text
			url = "https://www.tripadvisor.com" + beach_scrape.xpath("//*[@id='TC_INNER#{index}']/div[1]/div[2]/div[1]/a").attribute('href').value
		    @new_beach = Best25Beaches::Beach.new(name, location, description, url)
		 	@new_beach
		end
	end

	def self.webpage_scrape
		Best25Beaches::Beach.all.each do |beach|
			webpage = Nokogiri::HTML(open(beach.url))
			beach.excellent_review_percentage ||= webpage.css("span.row_count.row_cell").text[0...3]
			beach.rating ||= webpage.css("#taplc_location_detail_overview_attraction_0 > div.block_wrap.easyClear > div.overviewContent > div.ui_columns.is-multiline.is-mobile.reviewsAndDetails > div.ui_column.is-6.reviews > div.rating > span").text
			beach.activities ||= webpage.xpath("#taplc_location_detail_header_attractions_0 > div.rating_and_popularity > span.header_detail.attraction_details > div")
			binding.pry
	 	end										
	end

	def self.nearby
		Best25Beaches::Beach.all.each do |beach|
			webpage = Nokogiri::HTML(open(beach.url))
			beach.hotels = []
			beach.restaurants = []
			beach.nearby_attractions = []
			counter = 1
				while counter <= 3
				beach.hotels << webpage.xpath("//*[@id='LOCATION_TAB']/div[3]/div/div[#{counter}]/div/div[2]/div[1]").text
				beach.restaurants << webpage.xpath("//*[@id='LOCATION_TAB']/div[4]/div/div[#{counter}]/div/div[2]/div[1]").text
				beach.nearby_attractions << webpage.xpath("//*[@id='LOCATION_TAB']/div[5]/div/div[#{counter}]/div/div[2]/div[1]").text
				counter += 1
				end
		end
	end

end
	


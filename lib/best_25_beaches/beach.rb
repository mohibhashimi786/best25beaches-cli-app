class Best25Beaches::Beach 

	@@all = []

	attr_accessor :name, :location, :description, :url, :activities, :rating, :excellent_review_percentage, :visitor_thoughts

	def initialize(name = nil, location = nil, description = nil, url = nil)
		@name = name
		@location = location
		@description = description
		@url = url
		self.class.all << self
	end

	def self.create_from_index(beach)
		name = beach.xpath("//*[@id='TC_INNER1']/div[1]/div[2]/div[1]/a").text
		location = beach.xpath("//*[@id='TC_INNER5']/div[1]/div[2]/div[2]/a").text
		description = beach.xpath("//*[@id='TC_INNER5']/div[2]/div[1]/ul/li/div/text()").text
		url = "https://www.tripadvisor.com#{beach.xpath("//*[@id='TC_INNER2']/div[1]/div[2]/div[1]/a").attribute('href').value}"
		self.new(name, location, description, url)
		binding.pry
	end

	def self.all
		@@all 
	end

	def webpage
		@webpage ||= Nokogiri::HTML(open(self.url))
	end


	def activities
		@activities ||= webpage.xpath("//*[@id='taplc_location_detail_header_attractions_0']/div[1]/span[3]/div")
	end

	def rating
		@rating ||= webpage.xpath("//*[@id='taplc_location_detail_overview_attraction_0']/div[1]/div[2]/div[2]/div[2]/div[1]/span")
	end

	def excellent_review_percentage
		excellent_review_percentage ||= webpage.xpath("||= //*[@id='taplc_location_detail_overview_attraction_0']/div[1]/div[2]/div[2]/div[2]/div[2]/ul/li[1]/span[3]")
	end

	def visitor_thoughts
		@visitor_thoughts ||= webpage.xpath("//*[@id='taplc_location_detail_overview_attraction_0']/div[1]/div[2]/div[2]/div[1]/div[1]/div/div[1]/text()")
	end


end

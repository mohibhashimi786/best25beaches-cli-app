class Best25Beaches::Beach 

	@@all = []

	attr_accessor :name, :location, :description, :url, :activities, :rating, :excellent_review_percentage, :visitor_thoughts

	def initialize(name = nil, location = nil, description = nil, url = nil)
		@name = name
		@location = location
		@description = description
		@url = url
		@@all << self
		
	end

	def self.locate(selector)
		self.all[selector - 1]
	end

	def self.all
		@@all 
	end

	def webpage
		@webpage ||= Nokogiri::HTML(open(self.url))
	end


	def activities
		@activities ||= webpage.xpath("//*[@id='taplc_location_detail_header_attractions_0']/div[1]/span[3]/div").css("a").text

	end

	def rating
		@rating ||= webpage.css("#taplc_location_detail_overview_attraction_0 > div.block_wrap.easyClear > div.overviewContent > div.ui_columns.is-multiline.is-mobile.reviewsAndDetails > div.ui_column.is-6.reviews > div.rating > span").text


	end

	def excellent_review_percentage
		@excellent_review_percentage ||= webpage.css("span.row_count.row_cell").text[0...3]
															
	end

	def visitor_thoughts
		@visitor_thoughts ||= webpage.xpath("//*[@id='taplc_location_detail_overview_attraction_0']/div[1]/div[2]/div[2]/div[1]/div[1]/div/div[1]/text()").text
	end


end

class Best25Beaches::Beach 

	attr_accessor :name, :location, :description, :url

	def initialize(name = nil, location = nil, description = nil, url = nil)
		@name = name
		@location = location
		@description = description
		@url = url
	end

	def self.create_from_index(beach)
		name = beach.xpath("//*[@id='TC_INNER1']/div[1]/div[2]/div[1]/a").text
		location = beach.xpath("//*[@id='TC_INNER5']/div[1]/div[2]/div[2]/a").text
		description = beach.xpath("//*[@id='TC_INNER5']/div[2]/div[1]/ul/li/div/text()").text
		url = beach.xpath("//*[@id='TC_INNER5']/div[1]/div[2]/div[1]/a")
		binding.pry
		self.new(name, location, description, url)
	end



end

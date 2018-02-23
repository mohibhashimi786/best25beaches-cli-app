class Best25Beaches::Beach 

	@@all = []

	attr_accessor :name, :location, :description, :url, :activities, :rating, :excellent_review_percentage, :hotels, :restaurants, :attractions

	def initialize(name = nil, location = nil, description = nil, url = nil)
		@name = name
		@location = location
		@description = description
		@url = url
		self.class.all << self
		
	end

	def self.locate(selector)
		self.all[selector - 1]
	end

	def self.all
		@@all 
	end

	


end

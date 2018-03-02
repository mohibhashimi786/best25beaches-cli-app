class Best25Beaches::Beach 

	#captures all 'Beach' objects to allow manipulations at a later point
	@@all = []

	#assigns attributes to the 'Beach' class as well as to individual 'beaches'
	attr_accessor :name, :location, :description, :url, :activities, :rating, :excellent_review_percentage, :hotels, :restaurants, :nearby_attractions

	#initializes each 'Beach' object with respective required attributes & sends each object created to the class variable '@@all'
	def initialize(name = nil, location = nil, description = nil, url = nil)
		@name = name
		@location = location
		@description = description
		@url = url
		self.class.all << self
	end

	#'locator' method to capture individual 'beach' objects for manipulation
	def self.locate(selector)
		self.all[selector - 1]
	end

	#'@@all' class variable getter
	def self.all
		@@all 
	end

	


end

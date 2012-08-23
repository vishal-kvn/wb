# class Location < ActiveRecord::Base
class Location < Hashie::Mash
	def self.weather(lat, lng)
		begin
			@url = "http://api.met.no/weatherapi/locationforecast/1.8/?lat=#{lat};lon=#{lng}"
			@response = RestClient.get @url
			@response_hash = Hash.from_xml(@response)
			@response_hash["weatherdata"]["product"]["time"][0]["location"]
			#add error check when api is down
		rescue 
			# raise(RestClient::BadRequest, "test erroring")
			raise("something is wrong")
		end
	end
end

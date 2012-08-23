require 'rest_client'

class HomeController < ApplicationController
	before_filter :latlng
	def index
		if !@geo_location.empty?
			@weather = Location.weather(@latitude, @longitude)
		else
			flash[:error] = "Please enter a valid location"
		end
	end

	def latlng
		# debugger
		@ip_address = (request.ip=="127.0.0.1") ? "69.142.67.13" : request.ip#request.ip
		@geo_location = Geocoder.search(params[:search] || @ip_address)
		@location = nil

		if !@geo_location.empty?
			if params[:search]
				# @geo_location = Geocoder.search(params[:search])
				@latitude = @geo_location[0].data["geometry"]["location"]["lat"]
				@longitude = @geo_location[0].data["geometry"]["location"]["lng"]
				@location = @geo_location[0].formatted_address

			else
				@latitude = @geo_location[0].latitude
				@longitude = @geo_location[0].longitude
				@location = @geo_location[0].data["city"] + " " + @geo_location[0].data["region_code"] + "(Current Location)"
				# [@geo_location[0].latitude, @geo_location[0].longitude]

			end
		end
	end
end

require 'spec_helper'

describe HomeController do
	describe 'finding weather' do
		before(:each) do
			@resp_hash = {
				"altitude"=>"126",
				 "latitude"=>"40.0409",
				 "longitude"=>"-75.6374",
				 "temperature"=>{"id"=>"TTT", "unit"=>"celcius", "value"=>"19.4"},
				 "windDirection"=>{"id"=>"dd", "deg"=>"285.8", "name"=>"W"},
				 "windSpeed"=>{"id"=>"ff", "mps"=>"0.6", "beaufort"=>"1", "name"=>"Flau vind"},
				 "humidity"=>{"value"=>"84.5", "unit"=>"percent"},
				 "pressure"=>{"id"=>"pr", "unit"=>"hPa", "value"=>"1021.7"},
				 "cloudiness"=>{"id"=>"NN", "percent"=>"94.5"},
				 "fog"=>{"id"=>"FOG", "percent"=>"0.0"},
				 "lowClouds"=>{"id"=>"LOW", "percent"=>"0.0"},
				 "mediumClouds"=>{"id"=>"MEDIUM", "percent"=>"0.0"},
				 "highClouds"=>{"id"=>"HIGH", "percent"=>"94.5"}
				}
		end

		it 'should find weather based on current location' do
			request.stub(:ip).and_return("69.142.67.13")
			Location.should_receive(:weather).with(40.0409, -75.6374).and_return(@resp_hash)

			get :index#, {:search => "new york"}
			assigns(:latitude).should == 40.0409
			assigns(:longitude).should == -75.6374
			assigns(:weather).should_not be nil
		end

		it 'should search for weather at a given location' do
			Location.should_receive(:weather).with(40.750354, -73.993371).and_return(@resp_hash)

			get :index, {:search => "new york"}
			assigns(:latitude).should == 40.750354
			assigns(:longitude).should == -73.993371
			assigns(:weather).should_not be nil			
		end

		it 'should notify user about an invalid location' do
			Geocoder.should_receive(:search).with("qwerty").and_return([])

			get :index, {:search => "qwerty"}
			assigns(:latitude).should be nil
			assigns(:longitude).should be nil
			flash[:error].should == "Please enter a valid location"
		end
	end
end

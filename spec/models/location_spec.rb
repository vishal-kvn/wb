require 'spec_helper'

describe Location do
	describe 'should return weather' do
	    it 'should return weather for valid latitude and longitude' do
	      # Location.should_receive(:weather).with()
	      Location.weather(40.0409, -75.6374)
	    end
	    it 'should raise Error for invalid latitude and longitude' do
	    	lambda {Location.weather("zxczxc", "sdfsd")}.should raise_error("something is wrong")
	    end
	end
end
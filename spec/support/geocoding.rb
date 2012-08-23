# https://github.com/alexreisner/geocoder/blob/master/test/fixtures/google_madison_square_garden.json
google_json = <<-JSON
  {
    "status": "OK",
    "results": [ {
      "types": [ "street_address" ],
      "formatted_address": "4 Penn Plaza, New York, NY 10001, USA",
      "address_components": [ {
        "long_name": "4",
        "short_name": "4",
        "types": [ "street_number" ]
      }, {
        "long_name": "Penn Plaza",
        "short_name": "Penn Plaza",
        "types": [ "route" ]
      }, {
        "long_name": "Manhattan",
        "short_name": "Manhattan",
        "types": [ "sublocality", "political" ]
      }, {
        "long_name": "New York",
        "short_name": "New York",
        "types": [ "locality", "political" ]
      }, {
        "long_name": "New York",
        "short_name": "New York",
        "types": [ "administrative_area_level_2", "political" ]
      }, {
        "long_name": "New York",
        "short_name": "NY",
        "types": [ "administrative_area_level_1", "political" ]
      }, {
        "long_name": "United States",
        "short_name": "US",
        "types": [ "country", "political" ]
      }, {
        "long_name": "10001",
        "short_name": "10001",
        "types": [ "postal_code" ]
      } ],
      "geometry": {
        "location": {
          "lat": 40.7503540,
          "lng": -73.9933710
        },
        "location_type": "ROOFTOP",
        "viewport": {
          "southwest": {
            "lat": 40.7473324,
            "lng": -73.9965316
          },
          "northeast": {
            "lat": 40.7536276,
            "lng": -73.9902364
          }
        }
      }
    } ]
  }
JSON

# https://github.com/alexreisner/geocoder/blob/master/test/fixtures/freegeoip_74_200_247_59.json  
# "69.142.67.13"
freegeoip_json = <<-JSON
   {
    "city": "Exton",
    "region_code": "PA",
    "region_name": "Pennsylvania",
    "metrocode": "504",
    "zipcode": "19341",
    "longitude": "-75.6374",
    "latitude":"40.0409",
    "country_code": "US",
    "ip": "69.142.67.13",
    "country_name": "United States"
  }
JSON


FakeWeb.register_uri(:any, %r|http://maps\.googleapis\.com/maps/api/geocode|, :body => google_json)
FakeWeb.register_uri(:any, %r|http://freegeoip\.net/|, :body => freegeoip_json)
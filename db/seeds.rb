require 'json'
require 'csv'
State.delete_all
City.delete_all
User.delete_all
Landmark.delete_all
Route.delete_all
Waypoint.delete_all
Owner.delete_all

kyle = User.create :name => "Kyle Magida",:email => "kyle@example.org",:password => "password",:password_confirmation => "password", :admin => true 
john = User.create :name => "John Smith",:email => "john@example.org",:password => "password",:password_confirmation => "password", :admin => false

CSV.foreach("data/us-state-capitals.csv") do |row| # From https://gist.github.com/mbostock/9535021 & http://www.fonz.net/blog/archives/2008/04/06/csv-of-states-and-state-abbreviations/

  capital = City.new
  capital.name = row[1]
  capital.lat = row[2]
  capital.long = row[3]
  capital.full_name = row[1] + ', ' + row[4]
  capital.save
  

  state = State.new 
  state.name = row[0]
  state.abbreviation = row[4]
  state.capital_city = capital.id
  state.save
  
  capital.state_id = state.id
  state.save
  capital.save  
end

file = File.read('data/cities.json') # From https://gist.github.com/Miserlou/c5cd8364bf9b2420bb29
city_hashs = JSON.parse(file)
city_hashs.each do |city_hash|
	state = State.find_by(name: city_hash["state"])
	city = City.find_by(full_name: city_hash["city"]+ ', ' + state.abbreviation)
	if !city
		city = City.new
		city.name = city_hash["city"]		
		city.save
	end	
	
	city.population = city_hash["population"]
	city.lat = city_hash["latitude"]
	city.long = city_hash["longitude"]
	city.full_name = city.name + ', ' + state.abbreviation
	


	city.state_id = state.id
	city.save

	end

gc = Landmark.new
gc.name = "Grand Canyon"
gc.description = "A really big hole in the ground"
flag = City.find_by(full_name: "Flagstaff, AZ")
gc.city_id = flag.id
gc.image_url = "grand_canyon.jpg"
gc.save

wash_mon = Landmark.new
wash_mon.name = "Washington Monument"
wash_mon.description = "A tall granite spire in Washington DC."
dc = City.find_by(full_name: "Washington, DC")
wash_mon.city_id = dc.id
wash_mon.image_url = "washington_monument.jpg"
wash_mon.save

white_house = Landmark.new
white_house.name = "White House"
white_house.description = "Where the president lives, painted white, is a house."
dc = City.find_by(full_name: "Washington, DC")
white_house.city_id = dc.id
white_house.image_url = "white_house.jpg"
white_house.save

bean = Landmark.new
bean.name = "Cloudgate"
bean.description = "Commonly known as the Bean, this is polished metal in downtown Chicago."
chi = City.find_by(full_name: "Chicago, IL")
bean.city_id = chi.id
bean.image_url = "bean.jpg"
bean.save

rushmore = Landmark.new
rushmore.name = "Mt. Rushmore"
rushmore.description = "A bunch of faces on the side of a mountain."
rapid = City.find_by(full_name: "Rapid City, SD")
rushmore.city_id = rapid.id
rushmore.image_url = "rushmore.jpg"
rushmore.save

statue = Landmark.new
statue.name = "Statue of Liberty"
statue.description = "A tall copper women welcoming people."
nyc = City.find_by(full_name: "New York, NY")
statue.city_id = nyc.id
statue.image_url = "statue.jpg"
statue.save

strip = Landmark.new
strip.name = "Vegas Strip"
strip.description = "Bright lights that take your money."
vegas = City.find_by(full_name: "Las Vegas, NV")
strip.city_id = vegas.id
strip.image_url = "vegas_strip.jpg"
strip.save

parks = Route.new
parks.name = "National Park Tour"
parks.legs = 3
parks.description = "See national parks by driving round trip from Chicago"
parks.save

ny_to_dc = Route.new
ny_to_dc.name = "New York to DC to Miami"
ny_to_dc.description = "Go from NY to DC and see the sights and then go to the beach"
ny_to_dc.legs = 2
ny_to_dc.save

fear = Route.new
fear.name = "Fear & Loathing"
fear.description = "Recreate Fear & Loathing in Las Vegas, drive through a desert"
fear.legs = 1
fear.save

parks1 = Waypoint.new
parks1.route_id = parks.id
parks1.city_id = bean.city_id
parks1.route_number = 0
parks1.save

parks2 = Waypoint.new
parks2.route_id = parks.id
parks2.city_id = gc.city_id
parks2.route_number = 1
parks2.save

parks3 = Waypoint.new
parks3.route_id = parks.id
parks3.city_id = rushmore.city_id
parks3.route_number = 2
parks3.save

parks4 = Waypoint.new
parks4.route_id = parks.id
parks4.city_id = bean.city_id
parks4.route_number = 3
parks4.save

ny_dc_1 = Waypoint.new
ny_dc_1.route_id = ny_to_dc.id
ny_dc_1.city_id = statue.city_id
ny_dc_1.route_number = 0
ny_dc_1.save

ny_dc_2 = Waypoint.new
ny_dc_2.route_id = ny_to_dc.id
ny_dc_2.city_id = white_house.city_id
ny_dc_2.route_number = 1
ny_dc_2.save

ny_dc_3 = Waypoint.new
ny_dc_3.route_id = ny_to_dc.id
ny_dc_3.city_id = City.find_by(full_name: "Miami, FL").id
ny_dc_3.route_number = 2
ny_dc_3.save

fear_1 = Waypoint.new
fear_1.route_id = fear.id
fear_1.city_id = City.find_by(full_name: "Los Angeles, CA").id
fear_1.route_number = 0
fear_1.save

fear_2 = Waypoint.new
fear_2.route_id = fear.id
fear_2.city_id = strip.city_id
fear_2.route_number = 1
fear_2.save

kyle_parks = Owner.new
kyle_parks.user_id = kyle.id
kyle_parks.route_id = parks.id
kyle_parks.completed = false
kyle_parks.save

















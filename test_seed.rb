require 'json'

City.delete_all
User.delete_all

kyle = User.create :name => "Kyle Magida",:email => "kyle@example.org",:password => "password",:password_confirmation => "password", :admin => true 

john = User.create(:name => "Kyle Magida",:email => "john@example.org",:password => "password",:password_confirmation => "password", :admin => false)

file = File.read('data/cities.json') 
city_hash = JSON.parse(file)
city_hash.each do |city|
	city = City.new
	city.city_hash["state"]

	
end
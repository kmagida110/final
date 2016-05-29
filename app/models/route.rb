class Route < ActiveRecord::Base
	
	has_many :waypoints
	has_many :owners
	has_many :users, :through => :owners
	has_many :cities, :through => :waypoints
	has_many :landmarks, :through => :cities
end

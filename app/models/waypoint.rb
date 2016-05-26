class Waypoint < ActiveRecord::Base
	belongs_to :city
	belongs_to :route
	has_many :landmarks, :through => :cities
end

class Waypoint < ActiveRecord::Base
	
	belongs_to :city, :dependent => :delete 
	belongs_to :route, :dependent => :delete
	has_many :landmarks, :through => :cities
end

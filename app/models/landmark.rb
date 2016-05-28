class Landmark < ActiveRecord::Base
	
	belongs_to :city, :dependent => :delete
	has_many :waypoints, :through => :city
	has_many :routes, :through => :waypoints
	validates :image_url, presence: true

end

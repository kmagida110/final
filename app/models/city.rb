class City < ActiveRecord::Base

	belongs_to :state 
	has_many :landmarks
	has_many :waypoints
	validates :state_id, presence: true
	validates :name, presence: true
	
end

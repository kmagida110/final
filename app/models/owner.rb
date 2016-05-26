class Owner < ActiveRecord::Base

	belongs_to :user
	belongs_to :route
	has_many :landmarks, :through => :route

end

class Owner < ActiveRecord::Base

	belongs_to :user, :dependent => :delete
	belongs_to :route, :dependent => :delete
	has_many :landmarks, :through => :route

end

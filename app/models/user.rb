class User < ActiveRecord::Base
	
	has_secure_password
	has_many :owners
	has_many :routes, :through => :owners
	has_many :landmarks, :through => :routes

end
class State < ActiveRecord::Base

	has_one :city, :dependent => :nullify
	has_many :cities, :dependent => :nullify

	has_many :landmarks, :through => :cities


end

class Landmark < ActiveRecord::Base
	
	belongs_to :city, :dependent => :delete

	belongs_to :state

end

class MainController < ApplicationController

	def index
		@landmarks = Landmark.all
		@cur_user = User.find_by(id: session[:user_id])
		# Show landmarks they haven't considers
		if @cur_user
			@landmarks = @landmarks - @cur_user.landmarks
		else
			
		end
	end

end
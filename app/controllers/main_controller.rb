class MainController < ApplicationController

	def index
		@landmarks = Landmark.all.limit(5)
		@cur_user = User.find_by(id: session[:user_id])
		@routes = Route.all.limit(5)
		# Show landmarks they haven't considered
		if @cur_user
			@landmarks = @landmarks - @cur_user.landmarks
		else
		
		
		end
	end

end
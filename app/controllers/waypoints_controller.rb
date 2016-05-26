class WaypointsController < ApplicationController

	def new
		@leg = params[:leg].to_i
		@route_id = params[:route_id]
		@waypoint = Waypoint.where(route_id: @route_id, route_number: @leg)[0]
		
	end

	def update
		way = Waypoint.find_by(id: params[:id])
		way.city_id = params[:waypoint][:city_id]

		way.save
		route_legs = Route.find_by(id: way.route_id).legs
		if way.route_number < route_legs
			redirect_to new_waypoint_path + '?route_id=' + way.route.id.to_s + '&leg=' + (way.route_number + 1).to_s
		else
			redirect_to route_path(way.route_id)
		end

	end

	def destroy
		User.delete(params[:id])
    	redirect_to users_url
    end

    def edit
    	@cur_user = User.find_by(id: session[:user_id])
		@user = User.find_by(id: params[:id])
		if @cur_user.admin
			render 'edit'
		return
			end
		if !@user || (@user.id != session[:user_id].to_i)
      		flash["notice"] = "Log in to access this user page!"
      		redirect_to root_path
    	end	
    end
end
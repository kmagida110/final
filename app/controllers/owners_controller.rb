class OwnersController < ApplicationController

	def create
		ur = Owner.new
		ur.route_id = params["route_id"]
		ur.user_id = params["user_id"]
		ur.completed = false
		ur.save
		redirect_to user_path(ur.user_id)
		
	end

	def edit
		route_id = params["route_id"]
		user_id = params["user_id"]
		ur = Owner.where(route_id: route_id, user_id: user_id)[0]
		ur.completed = params["completed"].to_i
		ur.save
		redirect_to user_path(ur.user_id)		
	end

	def destroy
		route_id = params["route_id"]
		user_id = params["user_id"]
		ur = Owner.where(route_id: route_id, user_id: user_id)[0]
		ur.delete
		redirect_to user_path(ur.user_id)	

	end	

end
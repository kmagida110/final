class RoutesController < ApplicationController

	def index
		@routes = Route.paginate(:page => params[:page],:per_page => 5)
		@cur_user = User.find_by(id: session[:user_id])
	end

	def show
		@route = Route.find_by(id: params[:id])
	end

	def new
		@route = Route.new
	end

	def create
		route = Route.new
		route_params = params[:route]
		route.name = route_params[:name]
		route.legs = route_params[:legs]
		route.description = route_params[:description]
		route.save
		0.upto(route.legs) do |y|
			way = Waypoint.new
			way.route_id = route.id
			way.route_number = y
			way.save
		end
		
		flash["notice"] = route.name + " Created, now add waypoints!"
		redirect_to new_waypoint_path + '?route_id=' + route.id.to_s + '&leg=0'
		
	end
	def destroy
		route = Route.find_by(id: params[:id])
		if route
			flash["notice"] = route.name + " Deleted"
			route.destroy
		end
		
		redirect_to routes_path

	end
	def edit
		@route = Route.find_by(id: params[:id])
	end

	def update
		route = Route.find_by(id: params[:id])
		route_params = params[:route]
		route.name = route_params[:name]
		route.description = route_params[:description]
		route.legs = route_params[:legs]
		0.upto(route.legs) do |y|
			del = Waypoint.where(route_id: route.id, route_number: y)
			del[0].delete
			way = Waypoint.new
			way.route_id = route.id
			way.route_number = y
			way.save
		end
		
		route.save	
		flash["notice"] = route.name + " Updated, now add waypoints!"
		redirect_to new_waypoint_path + '?route_id=' + route.id.to_s + '&leg=0'

	end

end
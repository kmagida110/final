class CitiesController < ApplicationController

	def show
		@city = City.find_by(id: params[:id])
		
	end

	def index
		@cities = City.order(:name).paginate(:page => params[:page],:per_page => 50)
		if params[:keyword].present?
      		@cities = @cities.where("full_name LIKE ? OR name = ?", "%#{params[:keyword]}%", params[:keyword])
      		if !@cities
      			flash["notice"] = "City not found"
      			redirect_to cities_path
      		end
    	end

	end

	def new
		@city = City.new
	end

	def create
		city_params = params[:city]
		city = City.new
		city.name = city_params[:name]
		city.state_id = city_params[:state_id]
		city.lat = city_params[:lat]
		city.long = city_params[:long]
		city.population = city_params[:population]
		state = State.find_by(id: city_params[:state_id])
		city.full_name = city.name + ', ' + state.abbreviation
		city.save
		flash["notice"] = city_params[:name] + " Added!"
		redirect_to cities_path
	end

	def edit
		@city = City.find_by(id: params[:id])
	end

	def update
		city = City.find_by(id: params[:id])
		city_params = params[:city]
		city.name = city_params[:name]
		city.state_id = city_params[:state_id]
		city.lat = city_params[:lat]
		city.long = city_params[:long]
		city.population = city_params[:population]
		state = State.find_by(id: city_params[:state_id])
		city.full_name = city.name + ', ' + state.abbreviation
		city.save
		flash["notice"] = city_params[:name] + " Edited!"
		redirect_to city_path(city)
	end
	def destroy
		city = City.find_by(id: params[:id])
		if city
			flash["notice"] = city.full_name + " Deleted"
			city.destroy
		end
		
		redirect_to cities_path
	end

	
end
class StatesController < ApplicationController

	def show
		@state = State.find_by(id: params[:id])
		@cities = @state.cities.order(population: :desc).paginate(:page => params[:page], :per_page => 10)
		
	end

	def index
		@states = State.paginate(:page => params[:page],:per_page => 10)
		if params[:keyword].present?
      		@states = @states.where("name LIKE ?", params[:keyword])
      		if !@states
      			flash["notice"] = "State not found"
      			redirect_to cities_path
      		end
      	end
   
	end
	
end
class LandmarksController < ApplicationController
	
	def show
		@landmark = Landmark.find_by(id: params[:id])		
	end

	def index
		@landmarks = Landmark.order(:name).paginate(:page => params[:page],:per_page => 10)
	end

	def destroy
		landmark = Landmark.find_by(id: params[:id])
		if landmark
			flash["notice"] = landmark.name + " Deleted"
			landmark.destroy
		end
		
		redirect_to landmarks_path
	end

	def edit
		@landmark = Landmark.find_by(id: params[:id])	
	end

	def new 
		@landmark = Landmark.new
	end

	def create
		landmark_params = params[:landmark]
		landmark = Landmark.new
		landmark.name = landmark_params[:name]
		landmark.city_id = landmark_params[:city_id]
		landmark.description = landmark_params[:description]
		landmark.image_url = landmark_params[:image_url]
		flash["notice"] = landmark_params[:name] + " Added!"
		landmark.save
		redirect_to landmarks_path
	end

	def update
		landmark = Landmark.find_by(id: params[:id])
		landmark_params = params[:landmark]
		landmark.name = landmark_params[:name]
		landmark.city_id = landmark_params[:city_id]
		landmark.description = landmark_params[:description]
		landmark.image_url = landmark_params[:image_url]
		flash["notice"] = landmark_params[:name] + " Updated!"
		landmark.save	
		redirect_to landmark_path(landmark)
	end

	
end
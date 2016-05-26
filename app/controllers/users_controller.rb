class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def index
		cur_user = User.find_by(id: session[:user_id])
		if cur_user && cur_user.admin
			@users = User.all.limit(100)
		else
			flash["notice"] = "You need to be an admin to see this page!"
			redirect_to root_path
		end
	end

	def create
		user_params = params[:user]
		user = User.new
		user.name = user_params[:name]
		user.email = user_params[:email]
		user.password = user_params[:password]
		user.admin = user_params[:admin]
		user.save
		flash["notice"] = "Sign up for " + user_params[:name] + " is successfull!"
		session["user_id"] = user.id
		redirect_to root_path
	end

	def show
		@user = User.find_by(id: params[:id])
		@cur_user = User.find_by(id: session[:user_id])
		@complete_routes = Owner.where(user_id: params[:id],completed: true)
		@incomplete_routes = Owner.where(user_id: params[:id],completed: false)
		if @cur_user.admin
			render 'show'
		return
		end
		if !@user || (@user.id != session[:user_id].to_i)
      		flash["notice"] = "Log in to access this user page!"
      		redirect_to root_path
    	end		
	end

	def update
		user = User.find_by(id: params[:id])
		user_params = params[:user]
		user.name = user_params[:name]
		user.email = user_params[:email]
		user.admin = user_params[:admin]
		if user_params[:password]
			user.password = user_params[:password]
		end
		user.save	
		redirect_to user_path(user)	

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
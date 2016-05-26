class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user
      if user.authenticate(params[:password])
        session["user_id"] = user.id
        flash["notice"] = "Welcome back, #{user.name}"
        redirect_to user_path(user.id)
        return
      else
      flash["notice"] = "Invalid email or password"
      redirect_to login_path
      return
      end
    else
    flash["notice"] = "Invalid email or password"
    redirect_to login_path
    return
    end
    flash["notice"] = "Invalid email or password"
    redirect_to login_path
    return
  end

  def destroy
    reset_session
    redirect_to root_url
  end

end

class SessionsController < ApplicationController
  def new
  end

  def new_admin
  end

  def create
    user = User.find_by(roll: params[:session][:roll].upcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to users_path
    else
      flash.now[:danger] = "Invalid Roll Number/Password combination"
      render 'new'
    end
  end

  def create_admin
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to admin_users_path
    else
      flash.now[:danger] = "Invalid Admin Credentials"
      render 'new_admin'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end

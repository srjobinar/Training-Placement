class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(roll: params[:session][:roll].upcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = "Invalid Roll Number/Password combination"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @password = User.new_token[0..8]
    @user.password = @password;
    if @user.save
      flash[:success] = "Please Note Down Your Password: "+@password
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :roll)
  end
end

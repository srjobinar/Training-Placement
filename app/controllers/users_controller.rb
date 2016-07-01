class UsersController < ApplicationController
  protect_from_forgery
  after_filter :set_csrf_cookie_for_ng

  before_action :is_logged_in?, only: [:index, :show, :edit, :update, :getcompanylist]

  def index
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @password = User.new_token[0..8]
    @user.password = @password;
    if @user.save
      flash[:success] = "Please Note Down Your Password: "+ @password
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def editpass
    @user = User.find(params[:id])
  end

  def updatepass
    @user = User.find(params[:id])
    @curr = user_params_passedit[:current_password]
    param = {:password => user_params_passedit[:password],:password_confirmation => user_params_passedit[:password_confirmation] }
    if  @user.authenticate(@curr)
       if @user.update_attributes(param)
         flash[:success] = "Password Successfully Updated"
         redirect_to @user
       else
         render 'editpass'
       end
    else
        flash.now[:danger] = "Your current password is Invalid: " + @curr.to_s# + @user.password_digest + "100000000001" + User.digest("UQem-c200")
        render 'editpass'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile Updated"
      redirect_to @user
    else
      render 'edit'
    end
  end


  def apply
    @user = current_user
    @user.companies << Company.find(params[:id])
    render nothing: true
  end

  def cancel_application
    @user = current_user
    @company = Company.find(params[:id])
    @company.users.delete(@user)
    render nothing: true
  end

  private

  def set_csrf_cookie_for_ng
  cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def user_params
    params.require(:user).permit(:name, :email, :roll)
  end

  def user_params_passedit
    params.require(:user).permit(:password, :password_confirmation, :current_password)
  end

  def is_logged_in?
    if !logged_in?
      redirect_to root_path
    end
  end

  protected

  # In Rails 4.2 and above
  def verified_request?
    super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
  end

  # In Rails 4.1 and below
  def verified_request?
    super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end
end

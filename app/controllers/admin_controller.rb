class AdminController < ApplicationController

  def index
  end

  def stats
  end

  def confirm_application
    @company = Company.find(params[:id])
    @user_ids = params(:list)
    @user_ids.each do |u|
     user = User.find(u)
     register = user.registers.where('company_id' => 1)
     register.status = 2
     register.save
    end
  end
  
end

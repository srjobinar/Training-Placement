class AdminController < ApplicationController

  def index
  end

  def stats
  end

  def confirm_application
    @company = Company.find(params[:company])
    @user_ids = params(:list)
    @user_ids.each do |u|
     user = User.find(u)
     register = user.registers.where('company_id = ?', @company.id).first
     register.status = 2
     register.save
    end
    branchcompany = @company.branchcompanies.where("branch_id = ?",params[:branch]).first
    branchcompany.state = 2
    branchcompany.save
  end

  def shortlist
    @company = Company.find(params[:company])
    @user_ids = params(:list)
    @company.save
    @user_ids.each do |u|
      user = User.find(u)
      register = user.registers.where('company_id = ?', @company.id).first
      register.status = 3
      register.save
    end
    branchcompany = @company.branchcompanies.where("branch_id = ?",params[:branch]).first
    branchcompany.state = 3
    branchcompany.save
    if(@company.branches.where('state < ?', 3).count == 0)
      @company.flag = 2
    end
  end

end

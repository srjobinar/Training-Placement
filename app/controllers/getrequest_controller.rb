class GetrequestController < ApplicationController


    def getcompanylist
      @user = current_user
      @branch = @user.branch
      @available = @branch.companies.where("flag = ?", 1) - @user.companies
      @applied = @user.companies.where("status = ?", 1)
      @registered = @user.companies.where("status = ?", 2)
      @completed = @user.companies.where("flag = ?", 2)
      @company = [@available,@applied,@registered,@completed]
      render json: @company
    end

    def company_by_branch
      @branch = Branch.all
      @companies_of_branch = []
      @branch.each do |b|
       @companies_of_branch << {b.id => b.companies}
      end
      @registered_users = []
      @company = Company.all
      @company.each do |c|
        @registered_users << {c.id => c.users}
      end
      render json: [@branch,@companies_of_branch,@registered_users]
    end


  private

    def is_logged_in?
      if !logged_in?
        redirect_to root_path
      end
    end
end

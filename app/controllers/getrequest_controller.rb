class GetrequestController < ApplicationController


    def getcompanylist
      @user = current_user
      @branch = @user.branch
      @available = @branch.companies.where("state = ?", 1) - @user.companies
      @applied = @user.companies.where("status = ?", 1)
      @registered = @user.companies.where("status = ?", 2)
      @completed = @branch.companies.where("flag = ?", 2)
      @company = [@available,@applied,@registered,@completed]
      render json: @company
    end

    def company_by_branch
      @branch = Branch.all
      @companies_of_branch = []
      @branch.each do |b|
        @temp = []
        b.companies.includes(:branchcompanies).each do |c|
          @temp << [c,c.users.where("status = ?",c.branchcompanies.first.state)]
        end
        @companies_of_branch << [b,@temp]
      end
      render json: @companies_of_branch
    end

    def company_stats
      @company = Company.find(params[:id])
      @applied = @company.users
      @registered = @company.users.where("status = ?", 2)
      @placed = @company.users.where("status = ?", 3)
      render json: [@applied,@registered,@placed]
    end


  private

    def is_logged_in?
      if !logged_in?
        redirect_to root_path
      end
    end
end

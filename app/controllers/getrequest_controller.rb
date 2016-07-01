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
      @list = []
      @branch.each do |b|
       @list << {b.id => b.companies}
      end
      render json: [@branch,@list]
    end


  private

    def is_logged_in?
      if !logged_in?
        redirect_to root_path
      end
    end
end
class CompaniesController < ApplicationController
  def new
    @company = Company.new
    @branches = Branch.all
  end

  def create
    @company = Company.new(company_params)
    #@password = User.new_token[0..8]
    #@company.password = @password;
    if @company.save
      flash[:success] = "Company registration successful"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(company_params)
      flash[:success] = "Details Updated"
      redirect_to @company
    else
      render 'edit'
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  private

  def company_params
    params.require(:company).permit(:name, :package, :last_date, :exam_date, branch_ids: [])
  end

end

class Branch < ActiveRecord::Base

    has_many :users
    has_many :companies, through: :branchcompanies
    has_many :branchcompanies
end

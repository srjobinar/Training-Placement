class Company < ActiveRecord::Base

  has_many :branchcompanies
  has_many :registers
  has_many :branches, through: :branchcompanies
  has_many :users, through: :registers

  # validates :name, presence: true, length: {maximum: 50}
  # validates :package, presence: true
  # validates :last_date, presence: true
  # validates :exam_date, presence: true
end

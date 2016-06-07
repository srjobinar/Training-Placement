class Branchcompany < ActiveRecord::Base
  belongs_to :branch
  belongs_to :company
end

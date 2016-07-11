class CreateBranchcompanies < ActiveRecord::Migration
  def change
    create_table :branchcompanies do |t|

      t.belongs_to :branch, index: true
      t.belongs_to :company, index: true
      t.integer :state, default: 1 
    end
  end
end

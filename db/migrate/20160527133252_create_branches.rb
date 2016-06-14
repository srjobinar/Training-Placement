class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :name
      t.string :code
      t.belongs_to :user, index:true
    end
  end
end

class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :package
      t.date :last_date
      t.date :exam_date
      t.float :cutoff   
      t.timestamps null: false
    end
  end
end

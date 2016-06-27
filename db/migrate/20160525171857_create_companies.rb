class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :job_desc
      t.integer :package
      t.date :last_date
      t.date :exam_date
      t.float :cutoff
      t.string :web_url
      t.integer :flag, default: 1
      t.timestamps null: false
    end
  end
end

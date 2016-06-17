class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :roll
      t.string :phone
      t.float :cgpa
      t.float :x_th
      t.float :xii_th
      t.belongs_to :branch, index:true
      t.timestamps null: false
    end
  end
end

class CreateRegisters < ActiveRecord::Migration
  def change
    create_table :registers do |t|

      t.belongs_to :user, index: true
      t.belongs_to :company, index: true
      t.timestamps null: false
    end
  end
end

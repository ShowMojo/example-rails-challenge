class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.timestamps null: false
    end
  end
end

class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name, index: true
      t.string :last_name, index: true

      t.timestamps null: false
    end
  end
end

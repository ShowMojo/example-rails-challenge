class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :first_name, null: false, index: true
      t.string :last_name, null: false, index: true

      t.timestamps
    end
  end
end

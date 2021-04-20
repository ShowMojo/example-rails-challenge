class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :firstName, null: false, limit: 50
      t.string :lastName, null: false, limit: 50

      t.timestamps
    end
  end
end

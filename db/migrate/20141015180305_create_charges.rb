class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.boolean :paid
      t.integer :amount
      t.string :currency
      t.boolean :refunded
      t.integer :customer_id
      t.integer :status, default: 0

      t.timestamps
    end
  end
end

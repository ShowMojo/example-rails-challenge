class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.integer :created
      t.boolean :paid
      t.integer :amount
      t.string :currency
      t.boolean :refunded
      t.integer :customer_id

      t.timestamps
    end
  end
end

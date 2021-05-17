class CreateCharges < ActiveRecord::Migration[6.1]
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

    add_index :charges, :customer_id
    add_index :charges, :paid
    add_index :charges, :refunded
  end
end

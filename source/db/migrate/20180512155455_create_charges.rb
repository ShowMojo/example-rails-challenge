class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.decimal :amount
      t.string :currency
      t.boolean :paid, default: false
      t.boolean :refunded, default: false
      t.integer :customer_id

      t.timestamps null: false
    end
    add_index :charges, :customer_id
    add_index :charges, :paid
    add_index :charges, :refunded
    add_index :charges, [:paid, :refunded]
  end
end

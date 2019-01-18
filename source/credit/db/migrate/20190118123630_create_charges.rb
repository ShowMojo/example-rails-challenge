class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.datetime :created
      t.boolean :paid
      t.integer :amount
      t.string :currency
      t.boolean :refunded
      t.references :customer

      t.timestamps
    end
    add_index :charges, :customer_id
  end
end

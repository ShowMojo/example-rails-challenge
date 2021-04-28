class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.boolean :paid, default: false
      t.float :amount
      t.string :currency, limit: 3, default: 'USD'
      t.boolean :refunded, default: false
      t.integer :customer_id

      t.timestamps null: false
    end

    add_index :charges, [:customer_id], name: "index_charges_on_customer_id", using: :btree
  end
end

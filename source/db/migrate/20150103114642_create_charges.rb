class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.boolean :paid, default: false
      t.decimal :amount, precision: 20, scale: 2
      t.string :currency, default: 'USD'
      t.boolean :refunded, default: false
      t.integer :customer_id

      t.timestamps null: false
    end

    add_index :charges, :customer_id
  end
end

class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.integer :created
      t.boolean :paid
      t.integer :amount
      t.string :currency, default: 'USD'
      t.boolean :refunded
      t.integer :customer_id

      t.timestamps null: false
    end
  end
end

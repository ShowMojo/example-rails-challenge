class CreateCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :charges do |t|
      t.integer :amount
      t.boolean :paid
      t.boolean :refunded
      t.string :currency, default: 'USD'
      t.integer :customer_id
      t.datetime :created

      t.timestamps
    end
  end
end

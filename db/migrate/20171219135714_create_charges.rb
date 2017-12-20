class CreateCharges < ActiveRecord::Migration[5.1]
  def change
    create_table :charges do |t|
      t.integer :created
      t.boolean :paid, default: false
      t.integer :amount, default: 0
      t.string :currency, default: 'usd'
      t.boolean :refunded, default: false
      t.integer :customer_id
      t.timestamps
    end
  end
end

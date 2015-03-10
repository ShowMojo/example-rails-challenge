class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.boolean :paid, default: false
      t.integer :amount
      t.string :currency, default: 'usd'
      t.boolean :refunded, default: false
      t.integer :customer_id

      t.timestamps null: false
    end
  end
end

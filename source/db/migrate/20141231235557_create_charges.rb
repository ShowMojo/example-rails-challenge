class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.boolean :paid, default: true
      t.integer :amount
      t.string :currency, default: 'USD'
      t.boolean :refunded, default: false
      t.integer :customer_id

      t.timestamps
    end
  end
end

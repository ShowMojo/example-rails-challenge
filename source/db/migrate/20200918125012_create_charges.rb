class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.boolean :paid, default: false
      t.integer :amount
      t.string :currency
      t.boolean :refunded, default: false
      t.integer :customer_id
      t.string :status, default: 'pending'

      t.timestamps null: false
    end
  end
end

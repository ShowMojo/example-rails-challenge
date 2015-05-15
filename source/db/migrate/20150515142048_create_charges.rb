class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.boolean :paid
      t.integer :amount
      t.string :currency, default: 'usd'
      t.boolean :refunded
      t.references :customer

      t.timestamps
    end
  end
end

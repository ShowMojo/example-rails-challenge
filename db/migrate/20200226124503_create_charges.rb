class CreateCharges < ActiveRecord::Migration[6.0]
  def change
    create_table :charges do |t|
      t.boolean :paid
      t.integer :amount
      t.string :currency, default: 'usd'
      t.boolean :refunded
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end

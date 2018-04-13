class CreateCharges < ActiveRecord::Migration[5.1]
  def change
    create_table :charges do |t|
      t.boolean :paid
      t.integer :amount
      t.string :currency, default: "usd"
      t.boolean :refunded
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end

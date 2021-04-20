class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.integer :created, null: false
      t.boolean :paid, default: false
      t.integer :amount, null: false
      t.string :currency, null: false, default: "usd"
      t.boolean :refunded, default: false
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

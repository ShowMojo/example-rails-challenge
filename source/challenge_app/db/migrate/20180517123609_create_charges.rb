class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.boolean :paid, null: false
      t.boolean :refunded, null: false, default: false
      t.decimal :amount, precision: 8, scale: 2, null: false
      t.string :currency, null: false, default: 'usd'
      t.references :customer, index: true

      t.timestamps null: false
    end
  end
end

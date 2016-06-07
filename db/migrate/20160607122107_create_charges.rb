class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.boolean :paid, default: true
      t.integer :amount, default: 0
      t.string :currency, default: 'usd'
      t.boolean :refunded, default: false
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

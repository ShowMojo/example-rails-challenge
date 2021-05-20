class CreateCharges < ActiveRecord::Migration[6.1]
  def change
    create_table :charges do |t|
      t.boolean :paid, default: false
      t.bigint :amount, null: false
      t.string :currency, default: 'usd'
      t.string :refunded, default: false
      t.references :customer, null: false
      t.timestamps
    end
  end
end

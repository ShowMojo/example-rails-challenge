class CreateCharges < ActiveRecord::Migration[6.0]
  def change
    create_table :charges do |t|
      t.integer :created, null: false
      t.boolean :paid, null: false
      t.integer :amount, null: false
      t.string :currency, null: false, default: 'usd'
      t.boolean :refunded, null: false

      t.belongs_to :customer

      t.timestamps
    end
  end
end

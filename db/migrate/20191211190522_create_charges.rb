class CreateCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :charges do |t|
      t.timestamp :created, null: false
      t.boolean :paid, null: false
      t.decimal :amount, precision: 12, scale: 2, null: false
      t.integer :currency, null: false
      t.boolean :refunded, null: false
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end

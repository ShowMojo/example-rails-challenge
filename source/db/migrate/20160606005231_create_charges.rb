class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.datetime :created
      t.boolean :paid
      t.decimal :amount, precision: 10, scale: 2
      t.string :currency
      t.boolean :refunded
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

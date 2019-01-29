class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.integer :created
      t.boolean :paid
      t.integer :amount
      t.string :currency
      t.boolean :refunded
      t.references :customer, index: true

      t.timestamps null: false
    end
    add_foreign_key :charges, :customers
  end
end

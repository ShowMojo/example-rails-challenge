class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.boolean :paid
      t.integer :amount
      t.string :currency
      t.boolean :refunded
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

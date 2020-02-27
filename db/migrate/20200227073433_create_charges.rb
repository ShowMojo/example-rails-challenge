class CreateCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :charges do |t|
      t.boolean :paid
      t.string :currency
      t.integer :amount
      t.boolean :refunded
      t.references :customer

      t.timestamps
    end
  end
end

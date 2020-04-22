class CreateCharges < ActiveRecord::Migration[6.0]
  def change
    create_table :charges do |t|
      t.binary :paid
      t.integer :amount
      t.string :currency
      t.binary :refunded
      t.references :customer

      t.timestamps
    end
  end
end

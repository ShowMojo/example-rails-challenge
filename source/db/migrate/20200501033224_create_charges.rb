class CreateCharges < ActiveRecord::Migration[6.0]
  def change
    create_table :charges do |t|
      t.integer :created
      t.boolean :paid
      t.float :amount
      t.string :currency
      t.boolean :refunded, default: false
      t.boolean :disputed, default: false
      t.references :customer

      t.timestamps
    end
  end
end

class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.integer :created
      t.boolean :paid
      t.decimal :amount
      t.string :currency
      t.boolean :refunded
      t.references :customer, index: true

      t.timestamps
    end
  end
end

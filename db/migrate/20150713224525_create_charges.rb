class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.integer :created
      t.boolean :paid
      t.float :amount
      t.boolean :refunded
      t.string :currency
      t.references :customer, index: true

      t.timestamps
    end
  end
end

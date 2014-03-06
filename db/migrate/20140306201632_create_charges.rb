class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.boolean :paid
      t.timestamp :created
      t.integer :amount
      t.string :currency
      t.boolean :refunded
      t.references :customer, index: true

      t.timestamps
    end
  end
end

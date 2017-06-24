class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.float :amount
      t.string :currency
      t.integer :created
      t.boolean :paid
      t.boolean :refunded
      t.integer :customer_id
    end
  end
end

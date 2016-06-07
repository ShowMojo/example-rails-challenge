class CreateCreaditcharges < ActiveRecord::Migration
  def change
    create_table :creaditcharges do |t|
      t.boolean :paid
      t.integer :amount
      t.string :currency
      t.boolean :refunded
      t.integer :customer_id

      t.timestamps null: false
    end
  end
end

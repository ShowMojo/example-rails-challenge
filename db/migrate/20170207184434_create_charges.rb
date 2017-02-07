class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.boolean :paid
      t.integer :amount_cents
      t.string :currency
      t.boolean :refunded
      t.belongs_to :customer, index: true
      t.timestamps null: false
    end
  end
end

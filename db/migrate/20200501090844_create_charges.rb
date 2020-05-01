class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.references :customer, foreign_key: true, index: true
      t.boolean :paid
      t.integer :amount
      t.string :currency
      t.boolean :refunded

      t.integer :created_at, null: false
    end
  end
end

class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.timestamp :created, null: false
      t.boolean :paid
      t.integer :amount
      t.string :currency
      t.boolean :refunded, default: false
      t.references :customer, index: true, foreign_key: true
    end
  end
end

# frozen_string_literal: true
class CreateCharges < ActiveRecord::Migration[5.0]
  def change
    create_table :charges do |t|
      t.references :customer
      
      t.boolean :paid
      t.decimal :amount, precision: 7, scale: 2
      t.string :currency
      t.boolean :refunded
      t.timestamps
    end
  end
end

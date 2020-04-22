# frozen_string_literal: true

# create customers credit card charges table
class CreateCreditCardCharges < ActiveRecord::Migration
  def change
    create_table :credit_card_charges do |t|
      t.boolean :paid
      t.integer :amount
      t.string :currency
      t.boolean :refunded
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :credit_card_charges, [:paid, :refunded]
    add_index :credit_card_charges, :paid
    add_index :credit_card_charges, :refunded
  end
end

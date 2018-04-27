class CreateCreditCardCharges < ActiveRecord::Migration
  def change
    create_table :credit_card_charges do |t|
      t.references :customer, index: true
      t.boolean :paid
      t.integer :amount
      t.string :currency
      t.boolean :refunded

      t.timestamps null: false
    end
    add_foreign_key :credit_card_charges, :customers
  end
end

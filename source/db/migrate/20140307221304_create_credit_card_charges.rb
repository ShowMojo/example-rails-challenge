class CreateCreditCardCharges < ActiveRecord::Migration
  def change
    create_table :credit_card_charges do |t|
      t.boolean :paid
      t.decimal :amount
      t.string :currency
      t.boolean :refunded
      t.references :customer, index: true

      t.timestamps
    end
  end
end

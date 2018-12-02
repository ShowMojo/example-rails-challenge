class CreateCreditCardCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_card_charges do |t|
      t.boolean :paid, default: false
      t.decimal :amount
      t.integer :currency
      t.boolean :refunded, default: false
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end

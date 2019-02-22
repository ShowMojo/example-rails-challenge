class CreateCreditCardCharges < ActiveRecord::Migration
  def change
    create_table :credit_card_charges do |t|
      t.references :customer, index: true, foreign_key: true
      t.boolean :paid
      t.decimal :amount
      t.string :currency
      t.boolean :refunded
      t.datetime :created

      t.timestamps null: false
    end
  end
end

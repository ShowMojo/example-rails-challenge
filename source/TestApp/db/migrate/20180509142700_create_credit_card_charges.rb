class CreateCreditCardCharges < ActiveRecord::Migration
  def change
    create_table :credit_card_charges do |t|
      t.datetime :created, null: false
      t.boolean :paid, default: false
      t.integer :amount, default: 0
      t.string :currency, default: :usd
      t.boolean :refunded, default: false
      t.integer :customer_id, null: false
    end
  end
end

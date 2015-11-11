class CreateCreditCardCharges < ActiveRecord::Migration
  def change
    create_table :credit_card_charges do |t|
      t.integer :customer_id, null: false
      t.boolean :paid, default: false
      t.decimal :amount
      t.boolean :refunded, default: false
      t.string :currency, default: 'usd'
      t.timestamps null: false
    end
  end
end

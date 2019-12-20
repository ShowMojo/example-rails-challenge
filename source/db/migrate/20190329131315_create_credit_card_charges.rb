class CreateCreditCardCharges < ActiveRecord::Migration
  def change
    create_table :credit_card_charges do |t|

      t.boolean :paid, default: false, null: false
      t.bigint :amount, null: false
      t.string :currency, default: "usd", null: false
      t.boolean :refunded, default: false, null: false
      t.references :customer, null: false

      t.timestamps null: false
    end
  end
end

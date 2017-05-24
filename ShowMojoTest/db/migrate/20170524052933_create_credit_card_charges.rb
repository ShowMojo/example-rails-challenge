class CreateCreditCardCharges < ActiveRecord::Migration
  def change
    create_table :credit_card_charges do |t|

      t.boolean :paid
      t.integer :amount_cents, default: 0
      t.boolean :refunded, default: false
      t.references :customer, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end

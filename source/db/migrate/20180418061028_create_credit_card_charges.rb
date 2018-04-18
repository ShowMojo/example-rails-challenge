class CreateCreditCardCharges < ActiveRecord::Migration
  def change
    create_table :credit_card_charges do |t|
      t.boolean :paid, default: false
      t.integer :amount
      t.string  :currency
      t.integer :customer_id
      t.integer :status
      
      t.timestamps null: false
    end
  end
end

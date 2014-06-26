class CreateCreditCardOperations < ActiveRecord::Migration
  def change
    create_table :credit_card_operations do |t|
      t.boolean :paid
      t.float :amount
      t.string :currency
      t.boolean :refunded

      t.timestamps
    end
  end
end

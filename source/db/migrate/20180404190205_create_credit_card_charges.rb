class CreateCreditCardCharges < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_card_charges do |t|

      t.timestamps
    end
  end
end

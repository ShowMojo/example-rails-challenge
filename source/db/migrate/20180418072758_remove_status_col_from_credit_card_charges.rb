class RemoveStatusColFromCreditCardCharges < ActiveRecord::Migration
  def change
    remove_columns :credit_card_charges, :status
  end
end

class AddRefundToCreditCardCharges < ActiveRecord::Migration
  def change
    add_column :credit_card_charges, :refunded, :boolean
  end
end

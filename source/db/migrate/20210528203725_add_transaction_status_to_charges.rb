class AddTransactionStatusToCharges < ActiveRecord::Migration[6.0]
  def change
    add_column :charges, :status, :integer
  end
end

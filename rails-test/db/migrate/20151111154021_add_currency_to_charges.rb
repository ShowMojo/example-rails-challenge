class AddCurrencyToCharges < ActiveRecord::Migration
  def change
    add_column :charges, :currency, :string, default: "usd", null: false
  end
end

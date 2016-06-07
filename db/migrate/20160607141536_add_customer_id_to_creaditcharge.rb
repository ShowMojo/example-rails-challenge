class AddCustomerIdToCreaditcharge < ActiveRecord::Migration
  def change
    add_column :creaditcharges, :customer_id, :integer
  end
end

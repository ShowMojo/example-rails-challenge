class AddStatusToCharges < ActiveRecord::Migration
  def change
    add_column :charges, :status, :string, null: false
  end
end

class RemoveCreatedFromCharge < ActiveRecord::Migration
  def change
    remove_column :charges, :created, :integer
  end
end

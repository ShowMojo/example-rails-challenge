class AddStatusToC2charge < ActiveRecord::Migration
  def change
    add_column :c2charges, :status, :integer
  end
end

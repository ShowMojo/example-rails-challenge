class AddRefunedAtToCharge < ActiveRecord::Migration
  def change
    add_column :charges, :refunded_at, :datetime
  end
end

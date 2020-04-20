class AddFailedAtAndDisputedAtToCharges < ActiveRecord::Migration
  def change
    add_column :charges, :failed_at, :datetime
    add_column :charges, :successful_at, :datetime
    add_column :charges, :disputed_at, :datetime
  end
end

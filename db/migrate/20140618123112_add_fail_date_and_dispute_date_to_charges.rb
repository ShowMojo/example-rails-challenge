class AddFailDateAndDisputeDateToCharges < ActiveRecord::Migration
  def change
    add_column :charges, :fail_date, :datetime
    add_column :charges, :dispute_date, :datetime
  end
end

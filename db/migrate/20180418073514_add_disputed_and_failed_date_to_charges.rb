class AddDisputedAndFailedDateToCharges < ActiveRecord::Migration
  def change
    add_column :charges, :disputed_date, :datetime
    add_column :charges, :failed_date, :datetime
  end
end

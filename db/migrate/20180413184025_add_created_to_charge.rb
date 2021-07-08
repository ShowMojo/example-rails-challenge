class AddCreatedToCharge < ActiveRecord::Migration[5.1]
  def change
    add_column :charges, :created, :datetime
  end
end

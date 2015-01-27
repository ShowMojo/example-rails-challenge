class CreateMycustomers < ActiveRecord::Migration
  def change
    create_table :mycustomers do |t|
      t.string :firstName
      t.string :lastName

      t.timestamps
    end
  end
end

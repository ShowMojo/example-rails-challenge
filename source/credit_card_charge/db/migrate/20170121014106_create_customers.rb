class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name, default: ''
      t.string :last_name,  default: ''
    end
  end
end

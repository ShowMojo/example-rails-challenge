class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.datetime :created
      t.boolean :paid
      t.integer :amount, :limit => 8 # use long int for a case we chareged Abramovich
      t.string :currency
      t.boolean :refunded
      t.integer :customer_id

      t.timestamps
    end
  end
end

class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.references :customer, index: true
      t.integer :amount
      t.string :currency
      t.string :status

      t.timestamps null: false
    end
  end
end

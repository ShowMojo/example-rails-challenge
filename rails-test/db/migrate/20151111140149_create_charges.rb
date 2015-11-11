class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.references :customer, null: false
      t.boolean :paid, default: true
      t.integer :amount, null: false
      t.boolean :refunded, default: false

      t.timestamps null: false
    end
  end
end

class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.boolean :paid, default: false, index: true
      t.integer :amount
      t.string :currency, limit: 3
      t.boolean :refunded, default: false, index: true
      t.references :customer, index: true

      t.timestamps null: false
    end
  end
end

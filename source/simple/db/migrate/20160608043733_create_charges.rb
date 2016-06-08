class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.integer :amount, null: false
      t.string :currency, null: false
      t.boolean :paid, null: false, default: false
      t.boolean :refunded, null: false, default: false
      t.references :customer, null: false, index: true

      t.timestamps null: false
    end
  end
end

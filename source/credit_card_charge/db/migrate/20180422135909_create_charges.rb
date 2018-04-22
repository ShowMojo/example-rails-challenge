class CreateCharges < ActiveRecord::Migration[5.1]
  def change
    create_table :charges do |t|
      t.boolean :paid, default: false
      t.integer :amount, default: 0
      t.string :currency
      t.boolean :refunded, default: false
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end

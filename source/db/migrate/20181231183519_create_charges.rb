class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.references :customer, index: true, foreign_key: true
      t.boolean :paid, null: false
      t.integer :amount, null: false
      t.string :currency, null: false
      t.boolean :refunded, null: false

      t.timestamps null: false
    end
  end
end

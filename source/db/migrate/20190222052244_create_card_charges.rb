class CreateCardCharges < ActiveRecord::Migration
  def change
    create_table :card_charges do |t|
      t.boolean :paid, default: false
      t.integer :amount
      t.string :currency
      t.boolean :refunded, default: false
      t.references :customer, index: true, foreign_key: true
      t.datetime :disputed_at, default: nil

      t.timestamps null: false
    end
  end
end

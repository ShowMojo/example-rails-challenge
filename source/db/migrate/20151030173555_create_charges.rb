class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.integer :amount, null: false
      t.integer :created, null: false
      t.string :currency, null: false
      t.references :customer, foreign_key: true, index: true
      t.boolean :paid, default: true, null: false
      t.boolean :refunded, default: false, null: false
    end
  end
end

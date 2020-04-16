class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.integer :created, null: false
      t.boolean :paid, null: false, default: false
      t.integer :amount, null: false, default: 0
      t.string :currency, null: false
      t.boolean :refunded, null: false, default: false
      t.references :customer, index: true
    end
  end
end

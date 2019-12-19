class CreateCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :charges do |t|
      t.integer :created
      t.boolean :paid, default: false, null: false, index: true
      t.decimal :amount, precision: 10, scale: 2
      t.string :currency, default: 'USD', null: false
      t.boolean :refunded, default: false, null: false, index: true
      t.references :customer
    end
  end
end

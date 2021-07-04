class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.integer :amount, defalut: 0
      t.string :currency
      t.boolean :refunded, default: false
      t.boolean :paid, default: false
      t.datetime :created
      t.references :customer, index: true
    end

    add_foreign_key :charges, :customers, on_delete: :nullify
  end
end

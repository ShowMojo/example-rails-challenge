class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.references :customer, index: true, foreign_key: true
      t.boolean :paid
      t.float :amount
      t.string :currency
      t.boolean :refunded

      t.timestamps null: false
    end
  end
end

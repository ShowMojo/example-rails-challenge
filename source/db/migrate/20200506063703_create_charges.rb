class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.integer :created
      t.boolean :paid
      t.integer :amount
      t.boolean :refunded
      t.string :currency
      t.belongs_to :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateCardCharges < ActiveRecord::Migration
  def change
    create_table :card_charges do |t|
      t.timestamp :created
      t.boolean :paid
      t.float :amount
      t.string :currency
      t.boolean :refunded
      t.references :customer, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end

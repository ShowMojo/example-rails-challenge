class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.datetime :created_at
      t.boolean :paid, default: false
      t.boolean :refunded, default: false
      t.integer :status
      t.money :amount
      t.references :customer, index: true
    end
  end
end

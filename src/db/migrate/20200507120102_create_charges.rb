class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.belongs_to :customer, index: true, foreign_key: true
      t.integer :amount
      t.string :currency, default: 'USD'
      t.boolean :refunded, default: false

      t.integer :state, default: 0

      t.timestamps null: false
    end
  end
end

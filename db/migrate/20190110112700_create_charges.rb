class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.integer :amount, null: false
      t.string :currency, default: 'USD'
      t.belongs_to :customer, index: true, foreign_key: true
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end

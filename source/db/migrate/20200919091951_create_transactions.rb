class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :created
      t.boolean :paid, default: false, index: true
      t.integer :amount
      t.string :currency, default: 'usd', index: true
      t.boolean :refunded, default: false, index: true
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

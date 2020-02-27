class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.boolean :paid, default: false
      t.integer :amount, null: false
      t.string :currency, default: 'usd'
      t.boolean :refunded, default: false
      t.integer :status, default: 0, null: false
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end

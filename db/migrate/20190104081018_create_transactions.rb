class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :customer, index: true, foreign_key: true
      t.boolean :paid, null: false
      t.integer :amount, null: false
      t.string :currency, null: false, default: :usd
      t.boolean :refunded, null: false
      t.string :status, null: false
      t.timestamps
    end
  end
end

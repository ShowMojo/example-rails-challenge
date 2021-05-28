class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.references :customer, index: true, foreign_key: true
      t.boolean :paid
      t.boolean :refunded
      t.string :currency
      t.integer :created

      t.timestamps null: false
    end
  end
end

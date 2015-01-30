class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.boolean :paid
      t.float :amount
      t.string :currency
      t.boolean :refunded
      t.integer :customer_id
      t.boolean :disputed

      t.timestamps

    end
    add_foreign_key :transactions, :customers
  end
end

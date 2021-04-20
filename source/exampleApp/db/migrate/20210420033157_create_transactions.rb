class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :created, null: false
      t.boolean :paid, null: false, default: false
      t.decimal :amount
      t.string :currency, null: false
      t.boolean :refunded, null: false, default: false
      t.references :customer, index: true, null: false

      t.timestamps
    end
  end
end

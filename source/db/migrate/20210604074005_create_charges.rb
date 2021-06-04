class CreateCharges < ActiveRecord::Migration[6.1]
  def change
    create_table :charges do |t|
      t.integer :created
      t.boolean :paid, default: true
      t.integer :amount, default: 0
      t.string :currency, limit: 3, default: 'usd'
      t.boolean :refunded, default: false
      t.belongs_to :customer
      # t.timestamps
    end
  end
end

class CreateCharges < ActiveRecord::Migration[6.0]
  def change
    create_table :charges do |t|
      t.references :customer, index: true
      t.integer :amount
      t.integer :status, default: 0
      t.datetime :created
      t.string :currency, default: 'usd'

      t.timestamps
    end

    add_index :charges, :status
  end
end

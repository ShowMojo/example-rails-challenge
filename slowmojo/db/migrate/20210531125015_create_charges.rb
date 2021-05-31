class CreateCharges < ActiveRecord::Migration[6.1]
  def change
    create_table :charges do |t|
      t.timestamp :created
      t.boolean :paid
      t.integer :amount
      t.string :currency
      t.boolean :refunded
      t.references :customers, foreign_key: true, index: true

      t.timestamps

      t.index([:paid, :refunded])
    end

  end
end

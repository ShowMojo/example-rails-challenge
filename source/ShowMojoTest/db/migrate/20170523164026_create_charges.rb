class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|

      # currenc column isn't needed because money gem supports currency column and default to usd
      t.boolean :paid,     default: false
      t.integer :amount_cents,   default: 0, null: false
      t.boolean :refunded, default: false
      t.references :customer, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end

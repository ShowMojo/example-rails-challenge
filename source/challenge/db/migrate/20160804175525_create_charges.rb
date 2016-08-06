class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.integer :customer_id,     null: false
      t.integer :amount_cents,    null: false
      t.string :currency,         null: false
      t.boolean :paid,            default: false
      t.boolean :refunded,        default: false

      t.timestamps null: false
    end

    add_index :charges, :customer_id
  end
end

class CreateCharge < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.datetime :created
      t.boolean :paid, null: false, default: false
      t.integer :amount
      t.string :currency
      t.boolean :refunded, null: false, default: false
      t.references :customer, index: true
    end

    add_foreign_key :charges,
                    :customers,
                    column: :customer_id,
                    on_delete: :nullify
  end
end

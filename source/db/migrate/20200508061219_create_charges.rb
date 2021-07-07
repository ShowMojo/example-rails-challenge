class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.boolean    :paid
      t.float      :amount
      t.string     :currency
      t.boolean    :refunded
      t.references :customer, foreign_key: true

      t.timestamps null: false
    end
  end
end

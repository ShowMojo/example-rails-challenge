class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.boolean :paid,     default: false
      t.float   :amount
      t.string  :currency, default: 'usd'
      t.boolean :refunded, default: false

      t.references :customer

      t.timestamps
    end
  end
end

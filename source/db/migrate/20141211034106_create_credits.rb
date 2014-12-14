class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.boolean :paid
      t.float :amount
      t.string :currency
      t.boolean :refunded
      t.integer :customer_id

      t.timestamps
    end
  end
end

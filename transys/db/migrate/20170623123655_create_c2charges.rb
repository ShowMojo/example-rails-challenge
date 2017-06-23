class CreateC2charges < ActiveRecord::Migration
  def change
    create_table :c2charges do |t|
      t.boolean :paid
      t.float :amount
      t.string :currency
      t.boolean :refunded
      t.belongs_to :customer, index:true

      t.timestamps null: false
    end
  end
end

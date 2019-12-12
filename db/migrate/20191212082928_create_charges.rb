class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.integer      :created
      t.boolean     :paid
      t.decimal     :amount, precision: 10, scale: 2
      t.string      :currency
      t.boolean     :refunded
      t.string      :status
      t.references  :customer, index: true
    end
  end
end

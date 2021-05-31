class CreateCardCharges < ActiveRecord::Migration[6.0]
  def change
    create_table :card_charges do |t|
      t.boolean :paid
      t.monetize :amount
      t.boolean :refunded
      t.belongs_to :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end

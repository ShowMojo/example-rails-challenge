class CreateCardCharges < ActiveRecord::Migration
  def change
    create_table :card_charges do |t|
      t.integer :created
      t.boolean :paid

      #money pattern supposed!
      t.integer  :amount
      t.string :currency
      t.string :refunded
      t.integer :status
      t.datetime :failed_date
      t.datetime :dispute_date
      t.belongs_to :customer, index: true

      t.timestamps
    end
  end
end

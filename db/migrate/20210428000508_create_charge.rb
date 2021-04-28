class CreateCharge < ActiveRecord::Migration[6.0]
  def change
    create_table :charges do |t|
      t.boolean :paid, null: false
      t.integer :amount, null: false
      t.column :currency, 'char(3)', null: false
      t.boolean :refunded, null: false
      t.belongs_to :customer, foreign_key: true, null: false
      t.timestamp :created, null: false

      t.timestamps
    end
  end
end

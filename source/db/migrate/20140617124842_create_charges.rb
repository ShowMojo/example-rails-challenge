class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.boolean 	:paid
      t.integer 	:amount
      t.string 		:currency
      t.boolean 	:refunded, default: false
      t.references 	:customer, index: true

      t.timestamps
    end
  end
end

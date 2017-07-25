class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|

    	t.datetime 		:created
    	t.integer 		:paid
    	t.integer 		:amount
    	t.string 		:currency
    	t.integer 		:refunded
    	t.references 	:customer, index: true

      t.timestamps
    end
  end
end

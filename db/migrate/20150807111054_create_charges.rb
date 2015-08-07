class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
    	t.boolean 		:paid, 				null: false
    	t.integer			:amount, 			null: false
    	t.integer			:currency, 		null: false, 		default: 0
    	t.boolean			:refunded,		null: false
    	t.integer			:customer_id, null: false

      t.timestamps 								null: false
    end

    add_index :charges, :customer_id
  end
end


class CreateCharges < ActiveRecord::Migration
	def change
		create_table :charges do |t|
			t.integer :created
			t.boolean :paid
			t.float :amount
			t.string :currency
			t.boolean :refunded
			t.references :customer

			t.timestamps
		end
	end
end

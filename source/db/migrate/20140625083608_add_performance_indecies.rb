class AddPerformanceIndecies < ActiveRecord::Migration
	def change
		add_index :charges, [:paid, :refunded]
		add_index :charges, [:refunded, :paid]
	end
end

class AddUserToCreditCardOperations < ActiveRecord::Migration
  def change
    add_reference :credit_card_operations, :user, index: true
  end
end

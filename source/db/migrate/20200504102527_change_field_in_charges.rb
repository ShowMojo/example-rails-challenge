# frozen_string_literal: true

class ChangeFieldInCharges < ActiveRecord::Migration
  def change
    change_column :charges, :customer_id, :integer, index: true, foreign_key: true, null: false
    change_column :charges, :paid, :boolean, default: false
    change_column :charges, :amount, :decimal, default: 0, null: false, precision: 12, scale: 2
    change_column :charges, :currency, :integer, null: false
    change_column :charges, :refunded, :boolean, default: false
  end
end

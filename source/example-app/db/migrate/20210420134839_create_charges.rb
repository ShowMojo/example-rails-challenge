class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.integer :created, null: false
      t.boolean :paid, null: false, default: false
      t.decimal :amount
      t.string :currency, null: false
      t.boolean :refunded, null: false, default: false
      t.references :customer, index: true, null: false

      t.timestamps
    end
    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE charges
            ALTER COLUMN created SET DEFAULT date_part('epoch', current_timestamp);
        SQL
      end
    end
  end
end

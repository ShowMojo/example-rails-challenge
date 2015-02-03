
ActiveRecord::Schema.define(version: 20150203145120) do

  create_table "charges", force: true do |t|
    t.boolean  "paid",                                 default: false
    t.decimal  "amount",      precision: 10, scale: 2
    t.string   "currency",                             default: "USD"
    t.boolean  "refunded",                             default: false
    t.integer  "customer_id"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  create_table "customers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

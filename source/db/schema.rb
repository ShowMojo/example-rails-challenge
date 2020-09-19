# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20200919091951) do

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "customers", ["first_name"], name: "index_customers_on_first_name"
  add_index "customers", ["last_name"], name: "index_customers_on_last_name"

  create_table "transactions", force: :cascade do |t|
    t.integer  "created"
    t.boolean  "paid",        default: false
    t.integer  "amount"
    t.string   "currency",    default: "usd"
    t.boolean  "refunded",    default: false
    t.integer  "customer_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "transactions", ["currency"], name: "index_transactions_on_currency"
  add_index "transactions", ["customer_id"], name: "index_transactions_on_customer_id"
  add_index "transactions", ["paid"], name: "index_transactions_on_paid"
  add_index "transactions", ["refunded"], name: "index_transactions_on_refunded"

end

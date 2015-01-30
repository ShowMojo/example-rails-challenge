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

ActiveRecord::Schema.define(version: 20150129092652) do

  create_table "customers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: true do |t|
    t.boolean  "paid"
    t.float    "amount",      limit: 24
    t.string   "currency"
    t.boolean  "refunded"
    t.integer  "customer_id"
    t.boolean  "disputed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transactions", ["customer_id"], name: "transactions_customer_id_fk", using: :btree

  add_foreign_key "transactions", "customers", name: "transactions_customer_id_fk"

end

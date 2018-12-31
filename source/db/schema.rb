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

ActiveRecord::Schema.define(version: 20181231184404) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"
  enable_extension "hstore"
  enable_extension "postgis_topology"

  create_table "charges", force: :cascade do |t|
    t.integer  "customer_id"
    t.boolean  "paid",        null: false
    t.integer  "amount",      null: false
    t.string   "currency",    null: false
    t.boolean  "refunded",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "status",      null: false
  end

  add_index "charges", ["customer_id"], name: "index_charges_on_customer_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "layer", id: false, force: :cascade do |t|
    t.integer "topology_id",                null: false
    t.integer "layer_id",                   null: false
    t.string  "schema_name",                null: false
    t.string  "table_name",                 null: false
    t.string  "feature_column",             null: false
    t.integer "feature_type",               null: false
    t.integer "level",          default: 0, null: false
    t.integer "child_id"
  end

  add_index "layer", ["schema_name", "table_name", "feature_column"], name: "layer_schema_name_table_name_feature_column_key", unique: true, using: :btree

  create_table "spatial_ref_sys", primary_key: "srid", force: :cascade do |t|
    t.string  "auth_name", limit: 256
    t.integer "auth_srid"
    t.string  "srtext",    limit: 2048
    t.string  "proj4text", limit: 2048
  end

  create_table "topology", force: :cascade do |t|
    t.string  "name",                      null: false
    t.integer "srid",                      null: false
    t.float   "precision",                 null: false
    t.boolean "hasz",      default: false, null: false
  end

  add_index "topology", ["name"], name: "topology_name_key", unique: true, using: :btree

  add_foreign_key "charges", "customers"
  add_foreign_key "layer", "topology", name: "layer_topology_id_fkey"
end

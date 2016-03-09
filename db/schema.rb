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

ActiveRecord::Schema.define(version: 20160305153343) do

  create_table "confirms", force: :cascade do |t|
    t.integer  "users_id",      limit: 4
    t.integer  "orders_id",     limit: 4
    t.string   "admin_name",    limit: 255
    t.string   "admin_address", limit: 255
    t.string   "restaurant",    limit: 255
    t.string   "quantity",      limit: 255
    t.string   "price",         limit: 255
    t.string   "order_date",    limit: 255
    t.boolean  "active",                    default: true
    t.string   "min_cost",      limit: 255
    t.string   "tot_cost",      limit: 255
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "confirms", ["orders_id"], name: "index_confirms_on_orders_id", using: :btree
  add_index "confirms", ["users_id"], name: "index_confirms_on_users_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "users_id",      limit: 4
    t.string   "admin_name",    limit: 255
    t.string   "admin_address", limit: 255
    t.string   "restaurant",    limit: 255
    t.string   "item",          limit: 255
    t.string   "quantity",      limit: 255
    t.string   "price",         limit: 255
    t.string   "order_date",    limit: 255
    t.boolean  "active",                    default: true
    t.string   "min_cost",      limit: 255
    t.string   "tot_cost",      limit: 255
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "orders", ["users_id"], name: "index_orders_on_users_id", using: :btree

  create_table "requests", force: :cascade do |t|
    t.integer  "users_id",   limit: 4
    t.integer  "orders_id",  limit: 4
    t.string   "restaurant", limit: 255
    t.string   "item",       limit: 255
    t.string   "quantity",   limit: 255
    t.string   "price",      limit: 255
    t.boolean  "accept",                 default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "requests", ["orders_id"], name: "index_requests_on_orders_id", using: :btree
  add_index "requests", ["users_id"], name: "index_requests_on_users_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "access_token", limit: 255
    t.string   "name",         limit: 255
    t.string   "email",        limit: 255
    t.string   "phone",        limit: 255
    t.string   "gender",       limit: 255
    t.string   "dob",          limit: 255
    t.string   "address",      limit: 255
    t.string   "gcm_reg_no",   limit: 255
    t.string   "photo_url",    limit: 255
    t.string   "salt",         limit: 255
    t.string   "password",     limit: 255
    t.boolean  "active",                   default: true
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

end

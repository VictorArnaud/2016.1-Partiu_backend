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

ActiveRecord::Schema.define(version: 20160507133025) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drivers", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "drivers", ["user_id"], name: "index_drivers_on_user_id", using: :btree

  create_table "passengers", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "passengers", ["user_id"], name: "index_passengers_on_user_id", using: :btree

  create_table "passengers_rides", id: false, force: :cascade do |t|
    t.integer "ride_id"
    t.integer "passenger_id"
  end

  add_index "passengers_rides", ["passenger_id"], name: "index_passengers_rides_on_passenger_id", using: :btree
  add_index "passengers_rides", ["ride_id"], name: "index_passengers_rides_on_ride_id", using: :btree

  create_table "rides", force: :cascade do |t|
    t.string   "title"
    t.string   "origin"
    t.string   "destiny"
    t.integer  "total_seats"
    t.datetime "departure_time"
    t.datetime "return_time"
    t.boolean  "is_finished"
    t.boolean  "is_subsistence_allowance"
    t.boolean  "is_only_departure"
    t.text     "description"
    t.integer  "vehicle_id"
    t.integer  "driver_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "rides", ["driver_id"], name: "index_rides_on_driver_id", using: :btree
  add_index "rides", ["vehicle_id"], name: "index_rides_on_vehicle_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "token"
    t.string   "gender"
    t.string   "photo_url"
    t.string   "facebook_id"
    t.string   "link_profile"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "color"
    t.string   "car_model"
    t.text     "description"
    t.integer  "driver_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "vehicles", ["driver_id"], name: "index_vehicles_on_driver_id", using: :btree

  add_foreign_key "passengers_rides", "passengers"
  add_foreign_key "passengers_rides", "rides"
end
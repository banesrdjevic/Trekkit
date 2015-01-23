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

ActiveRecord::Schema.define(version: 20150123194507) do



  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"


  create_table "locations", force: :cascade do |t|
    t.string   "address"
    t.string   "name"
    t.float    "lat"
    t.float    "lng"
    t.integer  "user_id"
    t.integer  "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.string   "travel_mode"
    t.integer  "distance"
    t.integer  "duration"
    t.integer  "dollars"
    t.integer  "score"
    t.integer  "trip_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "trips", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "age"
    t.string   "username"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "cta_train_stops", force: :cascade do |t|
    t.integer  "stop_id"
    t.string   "direction_id"
    t.string   "stop_name"
    t.float    "lng"
    t.float    "lat"
    t.string   "station_name"
    t.string   "station_descriptive_name"
    t.string   "parent_stop_id"
    t.boolean  "ada"
    t.boolean  "red"
    t.boolean  "brn"
    t.boolean  "g"
    t.boolean  "p"
    t.boolean  "pexp"
    t.boolean  "pink"
    t.boolean  "org"
    t.boolean  "blue"
    t.boolean  "y"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "cta_train_stops", ["lat"], name: "index_cta_train_stops_on_lat", using: :btree
  add_index "cta_train_stops", ["lng"], name: "index_cta_train_stops_on_lng", using: :btree
  add_index "cta_train_stops", ["stop_id"], name: "index_cta_train_stops_on_stop_id", using: :btree

end
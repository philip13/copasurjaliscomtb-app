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

ActiveRecord::Schema.define(version: 20170707231751) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.string   "years_range"
    t.integer  "laps"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "races", force: :cascade do |t|
    t.string   "title"
    t.date     "date"
    t.string   "photo"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "registers", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "race_id"
    t.integer  "rider_id"
    t.integer  "race_result"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_registers_on_category_id"
    t.index ["race_id"], name: "index_registers_on_race_id"
    t.index ["rider_id"], name: "index_registers_on_rider_id"
  end

  create_table "riders", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthdate"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "phone"
    t.string   "email"
    t.string   "bood_type"
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
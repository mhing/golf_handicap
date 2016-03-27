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

ActiveRecord::Schema.define(version: 20160317034312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "holes", force: :cascade do |t|
    t.integer  "par"
    t.integer  "handicap"
    t.integer  "yardage"
    t.boolean  "fir"
    t.boolean  "gir"
    t.integer  "score"
    t.integer  "putts"
    t.integer  "penalties"
    t.integer  "sand_shots"
    t.integer  "round_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "position"
  end

  add_index "holes", ["round_id"], name: "index_holes_on_round_id", using: :btree

  create_table "rounds", force: :cascade do |t|
    t.date     "date_played"
    t.integer  "score"
    t.decimal  "rating"
    t.integer  "slope"
    t.integer  "course_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "tee_box"
  end

  add_index "rounds", ["course_id"], name: "index_rounds_on_course_id", using: :btree

end

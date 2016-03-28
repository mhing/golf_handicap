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

ActiveRecord::Schema.define(version: 20160328003006) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hole_statistics", force: :cascade do |t|
    t.boolean  "fir",        default: false
    t.boolean  "gir",        default: false
    t.integer  "penalties",  default: 0
    t.integer  "putts"
    t.integer  "sand_shots", default: 0
    t.integer  "score"
    t.integer  "hole_id"
    t.integer  "round_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "position"
  end

  add_index "hole_statistics", ["hole_id"], name: "index_hole_statistics_on_hole_id", using: :btree
  add_index "hole_statistics", ["round_id"], name: "index_hole_statistics_on_round_id", using: :btree

  create_table "holes", force: :cascade do |t|
    t.integer  "par"
    t.integer  "handicap"
    t.integer  "yardage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "position"
    t.integer  "tee_box_id"
  end

  add_index "holes", ["tee_box_id"], name: "index_holes_on_tee_box_id", using: :btree

  create_table "rounds", force: :cascade do |t|
    t.date     "date_played"
    t.integer  "score"
    t.integer  "course_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "tee_box_id"
  end

  add_index "rounds", ["course_id"], name: "index_rounds_on_course_id", using: :btree
  add_index "rounds", ["tee_box_id"], name: "index_rounds_on_tee_box_id", using: :btree

  create_table "tee_boxes", force: :cascade do |t|
    t.decimal  "rating"
    t.integer  "slope"
    t.string   "name"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tee_boxes", ["course_id"], name: "index_tee_boxes_on_course_id", using: :btree

end

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

ActiveRecord::Schema.define(version: 20140723000337) do

  create_table "first_letters", force: true do |t|
    t.string   "letter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "last_letters", force: true do |t|
    t.string   "letter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lengths", force: true do |t|
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sorts", force: true do |t|
    t.string   "inclusion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "first_letter_id"
    t.integer  "last_letter_id"
    t.integer  "length_id"
  end

  create_table "words", force: true do |t|
    t.string   "text"
    t.integer  "sort_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "first_letter_id"
    t.integer  "last_letter_id"
    t.integer  "length_id"
  end

end

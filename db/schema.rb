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

ActiveRecord::Schema.define(version: 20140810182421) do

  create_table "deleted_words", force: true do |t|
    t.string   "deleted_word"
    t.text     "reason"
    t.integer  "sort_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deleted_words", ["deleted_word"], name: "index_deleted_words_on_deleted_word"
  add_index "deleted_words", ["reason"], name: "index_deleted_words_on_reason"
  add_index "deleted_words", ["sort_id"], name: "index_deleted_words_on_sort_id"

  create_table "sorts", force: true do |t|
    t.string   "sort"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sorts", ["sort"], name: "index_sorts_on_sort"

  create_table "words", force: true do |t|
    t.string   "word"
    t.integer  "sort_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "words", ["sort_id"], name: "index_words_on_sort_id"
  add_index "words", ["word"], name: "index_words_on_word"

end

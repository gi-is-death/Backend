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

ActiveRecord::Schema.define(version: 2018_12_01_150053) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "have_wikis", force: :cascade do |t|
    t.integer "wiki_id"
    t.integer "study_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.integer "grade"
    t.string "major"
    t.string "mobile_number"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notices", force: :cascade do |t|
    t.date "date"
    t.integer "author_ID"
    t.string "title"
    t.string "content"
    t.integer "seen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "studies", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "is_resgistration"
    t.integer "year"
    t.integer "semester"
    t.integer "limit_num_of_mem"
    t.integer "num_of_mem"
    t.integer "leader_ID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "take_studies", force: :cascade do |t|
    t.integer "mem_ID"
    t.integer "study_ID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wiki_categories", force: :cascade do |t|
    t.integer "category_id"
    t.integer "wiki_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wikis", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

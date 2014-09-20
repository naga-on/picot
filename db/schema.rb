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

ActiveRecord::Schema.define(version: 20140920191907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_genre_relations", force: true do |t|
    t.integer  "book_id",    null: false
    t.integer  "genre_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "title",                     null: false
    t.string   "author",     default: "",   null: false
    t.integer  "page",       default: 0,    null: false
    t.boolean  "is_active",  default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genres", force: true do |t|
    t.string   "name",                      null: false
    t.boolean  "is_active",  default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name",                            null: false
    t.string   "password_digest",                 null: false
    t.boolean  "is_admin",        default: false, null: false
    t.boolean  "is_active",       default: true,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "volumes", force: true do |t|
    t.string   "title",                     null: false
    t.string   "pdf_file",   default: "",   null: false
    t.string   "img_dir",    default: "",   null: false
    t.integer  "page",       default: 0,    null: false
    t.integer  "cover",      default: 1,    null: false
    t.boolean  "is_active",  default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

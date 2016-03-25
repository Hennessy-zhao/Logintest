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

ActiveRecord::Schema.define(version: 20160322084210) do

  create_table "comments", force: :cascade do |t|
    t.text     "commenter",       limit: 65535
    t.text     "comment_message", limit: 65535
    t.integer  "message_id",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["message_id"], name: "index_comments_on_message_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.text     "title",      limit: 65535
    t.text     "message",    limit: 65535
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "host",       limit: 255
  end

  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.string   "creator",    limit: 255
    t.string   "filename",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "img",        limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",     limit: 255
    t.string   "userpassword", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "comments", "messages"
  add_foreign_key "messages", "users"
end

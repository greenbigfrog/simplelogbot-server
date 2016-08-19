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

ActiveRecord::Schema.define(version: 20160818081041) do

  create_table "channels", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "channel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "display_name", null: false
    t.integer  "member_id",    null: false
    t.integer  "server_id",    null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "message_id", null: false
    t.text     "content",    null: false
    t.datetime "sent_at",    null: false
    t.datetime "edited_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "servers", force: :cascade do |t|
    t.string   "name",        null: false
    t.integer  "membercount", null: false
    t.integer  "server_id",   null: false
    t.integer  "owner_id",    null: false
    t.integer  "icon_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",      null: false
    t.integer  "user_id",       null: false
    t.boolean  "bot",           null: false
    t.string   "avatar_id",     null: false
    t.integer  "discriminator", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
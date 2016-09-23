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

ActiveRecord::Schema.define(version: 20160904102005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "discord_channels", id: false, force: :cascade do |t|
    t.string   "status",     null: false
    t.string   "name",       null: false
    t.bigint   "channel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_discord_channels_on_channel_id", unique: true, using: :btree
  end

  create_table "discord_memberships", id: false, force: :cascade do |t|
    t.string   "status",       null: false
    t.string   "display_name", null: false
    t.bigint   "user_id",      null: false
    t.bigint   "server_id",    null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "discord_messages", id: false, force: :cascade do |t|
    t.string   "status",     null: false
    t.bigint   "message_id", null: false
    t.text     "content",    null: false
    t.bigint   "user_id",    null: false
    t.bigint   "channel_id", null: false
    t.bigint   "server_id",  null: false
    t.datetime "sent_at",    null: false
    t.datetime "edited_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_discord_messages_on_message_id", unique: true, using: :btree
  end

  create_table "discord_servers", id: false, force: :cascade do |t|
    t.string   "status",      null: false
    t.string   "name",        null: false
    t.integer  "membercount", null: false
    t.bigint   "server_id",   null: false
    t.bigint   "owner_id",    null: false
    t.bigint   "icon_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["server_id"], name: "index_discord_servers_on_server_id", unique: true, using: :btree
  end

  create_table "discord_users", id: false, force: :cascade do |t|
    t.string   "status",                                   null: false
    t.string   "username",                                 null: false
    t.bigint   "user_id",                                  null: false
    t.boolean  "bot",                      default: false, null: false
    t.string   "avatar",        limit: 32
    t.integer  "discriminator",                            null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["user_id"], name: "index_discord_users_on_user_id", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "authentication_token",   limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end

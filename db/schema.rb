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

ActiveRecord::Schema.define(version: 20160731174405) do

  create_table "games", force: :cascade do |t|
    t.integer  "player_one"
    t.integer  "player_two"
    t.integer  "player_one_15",    default: 0
    t.integer  "player_two_15",    default: 0
    t.integer  "player_one_16",    default: 0
    t.integer  "player_two_16",    default: 0
    t.integer  "player_one_17",    default: 0
    t.integer  "player_two_17",    default: 0
    t.integer  "player_one_18",    default: 0
    t.integer  "player_two_18",    default: 0
    t.integer  "player_one_19",    default: 0
    t.integer  "player_two_19",    default: 0
    t.integer  "player_one_20",    default: 0
    t.integer  "player_two_20",    default: 0
    t.integer  "player_one_be",    default: 0
    t.integer  "player_two_be",    default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "player_one_score", default: 0
    t.integer  "player_two_score", default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

end

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

ActiveRecord::Schema.define(version: 20170629092113) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "evo_tovars", force: :cascade do |t|
    t.string "uuid"
    t.string "code"
    t.string "name"
    t.float "price"
    t.integer "quantity"
    t.float "costPrice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id"
    t.string "measureName", default: "шт"
    t.string "tax", default: "VAT_0"
    t.boolean "allowToSell", default: true
    t.string "description", default: ""
    t.string "parentUuid", default: "null"
    t.boolean "group", default: false
    t.string "type", default: "NORMAL"
    t.float "alcoholByVolume", default: 0.0
    t.integer "alcoholProductKindCode", default: 0
    t.float "tareVolume", default: 0.0
    t.string "barCodes", default: [], array: true
    t.string "alcoCodes", default: [], array: true
    t.boolean "check_post"
    t.index ["users_id"], name: "index_evo_tovars_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "userUuid"
    t.string "tokenEvo"
    t.string "token"
    t.string "key"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "login"
    t.string "password"
  end

end

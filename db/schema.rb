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

ActiveRecord::Schema.define(version: 20200113213514) do

  create_table "flights", force: :cascade do |t|
    t.string   "origin"
    t.string   "destination"
    t.integer  "cost"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "saved_cards", force: :cascade do |t|
    t.string   "last_four_digits", limit: 4
    t.string   "card_type"
    t.string   "token"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "flight_id"
    t.integer  "saved_card_id"
    t.integer  "ticket_count"
    t.string   "email"
    t.integer  "amount"
    t.string   "payment_method_token"
    t.string   "transaction_token"
    t.boolean  "save_card",            default: false, null: false
    t.boolean  "purchase_via_pmd",     default: false, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["flight_id"], name: "index_transactions_on_flight_id"
    t.index ["saved_card_id"], name: "index_transactions_on_saved_card_id"
  end

end

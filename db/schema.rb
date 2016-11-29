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

ActiveRecord::Schema.define(version: 20161211032514) do

  create_table "access_levels", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "background", limit: 255
  end

  create_table "active_events", force: :cascade do |t|
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_events", ["event_id"], name: "index_active_events_on_event_id"

  create_table "ad_types", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "value"
    t.string   "invoice_name", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "ads", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "contact",      limit: 255
    t.string   "phone",        limit: 255
    t.string   "email",        limit: 255
    t.integer  "ad_type_id"
    t.text     "address"
    t.text     "notes"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "salesman",     limit: 255
    t.integer  "event_id"
    t.integer  "parent_ad_id"
  end

  add_index "ads", ["event_id"], name: "index_ads_on_event_id"

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id",                null: false
    t.string   "provider",   limit: 255, null: false
    t.string   "uid",        limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "band_members", force: :cascade do |t|
    t.string   "band_id",    limit: 36
    t.string   "name",       limit: 255
    t.string   "role",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id"
    t.string   "phone",      limit: 255
  end

  create_table "bands", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "contact_name",       limit: 255
    t.string   "email",              limit: 255
    t.string   "phone",              limit: 255
    t.text     "address"
    t.string   "postal_code",        limit: 255
    t.string   "city",               limit: 255
    t.text     "description"
    t.string   "song_title",         limit: 255
    t.string   "song_composer",      limit: 255
    t.text     "song_lyrics"
    t.string   "playtime_wish",      limit: 255
    t.string   "playtime_wish_alt",  limit: 255
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
    t.boolean  "completed"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "event_id"
  end

  add_index "bands", ["event_id"], name: "index_bands_on_event_id"

  create_table "crew_applications", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "address"
    t.date     "birthday"
    t.string   "email",        limit: 255
    t.string   "phone",        limit: 255
    t.text     "experience"
    t.integer  "volunteer_id"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.boolean  "chosen"
  end

  create_table "crew_merchandise_order_lines", force: :cascade do |t|
    t.integer  "crew_merchandise_order_id"
    t.integer  "quantity"
    t.integer  "merchandise_article_variant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "crew_merchandise_order_lines", ["crew_merchandise_order_id"], name: "crew_merch_order_lines_crew_merch_order_id"
  add_index "crew_merchandise_order_lines", ["merchandise_article_variant_id"], name: "crew_merch_order_lines_merch_article_variant_id"

  create_table "crew_merchandise_orders", force: :cascade do |t|
    t.integer  "volunteer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "crew_merchandise_orders", ["volunteer_id"], name: "index_crew_merchandise_orders_on_volunteer_id"

  create_table "crew_wishes", force: :cascade do |t|
    t.integer  "crew_application_id"
    t.integer  "group_id"
    t.integer  "priority"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "from"
    t.datetime "to"
  end

  create_table "fireguards", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "age"
    t.text     "address"
    t.string   "phone",      limit: 255
    t.string   "mobile",     limit: 255
    t.string   "email",      limit: 255
    t.text     "notes"
    t.boolean  "active"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.boolean  "internal"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "description"
  end

  create_table "location_schedules", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "fireguard_id"
    t.integer  "slot"
    t.datetime "from"
    t.datetime "to"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "slots"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "merchandise_article_variants", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.integer  "merchandise_article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "merchandise_article_variants", ["merchandise_article_id"], name: "index_merchandise_article_variants_on_merchandise_article_id"

  create_table "merchandise_articles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "address"
    t.string   "email",      limit: 255
    t.string   "phone",      limit: 8
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "stage_schedules", force: :cascade do |t|
    t.integer  "stage_id"
    t.string   "band_id",    limit: 36
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "stages", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "from"
    t.datetime "to"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.string  "title",   limit: 255
    t.integer "user_id"
    t.integer "role_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",                        limit: 255, null: false
    t.string   "email",                           limit: 255
    t.string   "crypted_password",                limit: 255
    t.string   "salt",                            limit: 255
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "remember_me_token",               limit: 255
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token",            limit: 255
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "name",                            limit: 255
  end

  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token"

  create_table "volunteers", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "address"
    t.date     "birthday"
    t.string   "email",        limit: 255
    t.string   "phone",        limit: 255
    t.integer  "group_id"
    t.string   "access_level", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id"
  end

end

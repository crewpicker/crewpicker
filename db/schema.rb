# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_07_28_011755) do
  create_table "access_levels", force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "background", limit: 255
  end

  create_table "active_events", force: :cascade do |t|
    t.bigint "event_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["event_id"], name: "index_active_events_on_event_id"
  end

  create_table "ad_types", force: :cascade do |t|
    t.string "name", limit: 255
    t.bigint "value"
    t.string "invoice_name", limit: 255
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "ads", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "contact", limit: 255
    t.string "phone", limit: 255
    t.string "email", limit: 255
    t.bigint "ad_type_id"
    t.text "address"
    t.text "notes"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "salesman", limit: 255
    t.bigint "event_id"
    t.bigint "parent_ad_id"
    t.boolean "completed"
    t.index ["event_id"], name: "index_ads_on_event_id"
  end

  create_table "authentications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "provider", limit: 255, null: false
    t.string "uid", limit: 255, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "band_members", force: :cascade do |t|
    t.string "band_id", limit: 36
    t.string "name", limit: 255
    t.string "role", limit: 255
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "user_id"
    t.string "phone", limit: 255
  end

  create_table "bands", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "contact_name", limit: 255
    t.string "email", limit: 255
    t.string "phone", limit: 255
    t.text "address"
    t.string "postal_code", limit: 255
    t.string "city", limit: 255
    t.text "description"
    t.string "song_title", limit: 255
    t.string "song_composer", limit: 255
    t.text "song_lyrics"
    t.string "playtime_wish", limit: 255
    t.string "playtime_wish_alt", limit: 255
    t.string "image_file_name", limit: 255
    t.string "image_content_type", limit: 255
    t.bigint "image_file_size"
    t.datetime "image_updated_at", precision: nil
    t.bigint "user_id"
    t.boolean "completed"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "event_id"
    t.index ["event_id"], name: "index_bands_on_event_id"
    t.index ["user_id"], name: "index_bands_on_user_id"
  end

  create_table "crew_applications", force: :cascade do |t|
    t.string "name", limit: 255
    t.text "address"
    t.date "birthday"
    t.string "email", limit: 255
    t.string "phone", limit: 255
    t.text "experience"
    t.bigint "volunteer_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "chosen"
    t.bigint "event_id"
    t.index ["event_id"], name: "index_crew_applications_on_event_id"
    t.index ["user_id"], name: "index_crew_applications_on_user_id"
  end

  create_table "crew_merchandise_order_lines", force: :cascade do |t|
    t.bigint "crew_merchandise_order_id"
    t.bigint "quantity"
    t.bigint "merchandise_article_variant_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["crew_merchandise_order_id"], name: "crew_merch_order_lines_crew_merch_order_id"
    t.index ["merchandise_article_variant_id"], name: "crew_merch_order_lines_merch_article_variant_id"
  end

  create_table "crew_merchandise_orders", force: :cascade do |t|
    t.bigint "volunteer_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["volunteer_id"], name: "index_crew_merchandise_orders_on_volunteer_id"
  end

  create_table "crew_wishes", force: :cascade do |t|
    t.bigint "crew_application_id"
    t.bigint "group_id"
    t.bigint "priority"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.datetime "from", precision: nil
    t.datetime "to", precision: nil
    t.datetime "band_deadline", precision: nil
    t.datetime "volunteer_deadline", precision: nil
  end

  create_table "fireguards", force: :cascade do |t|
    t.string "name", limit: 255
    t.bigint "age"
    t.text "address"
    t.string "phone", limit: 255
    t.string "mobile", limit: 255
    t.string "email", limit: 255
    t.text "notes"
    t.boolean "active"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", limit: 255
    t.boolean "internal"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.text "description"
    t.string "tag"
  end

  create_table "location_schedules", force: :cascade do |t|
    t.bigint "location_id"
    t.bigint "fireguard_id"
    t.bigint "slot"
    t.datetime "from", precision: nil
    t.datetime "to", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", limit: 255
    t.bigint "slots"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "merchandise_article_variants", force: :cascade do |t|
    t.string "name", limit: 255
    t.bigint "merchandise_article_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["merchandise_article_id"], name: "index_merchandise_article_variants_on_merchandise_article_id"
  end

  create_table "merchandise_articles", force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "people", force: :cascade do |t|
    t.string "name", limit: 255
    t.text "address"
    t.string "email", limit: 255
    t.string "phone", limit: 8
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "stage_schedules", force: :cascade do |t|
    t.bigint "stage_id"
    t.string "band_id", limit: 36
    t.datetime "start", precision: nil
    t.datetime "end", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "stages", force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "from", precision: nil
    t.datetime "to", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "tk81_pameldinger", force: :cascade do |t|
    t.string "navn"
    t.date "fodselsdato"
    t.string "skole"
    t.string "telefon"
    t.string "navn_foresatte"
    t.string "epost_foresatte"
    t.string "telefon_foresatte"
    t.integer "foresatte_bidrag_id"
    t.integer "event_id", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_tk81_pameldinger_on_event_id"
    t.index ["foresatte_bidrag_id"], name: "index_tk81_pameldinger_on_foresatte_bidrag_id"
    t.index ["user_id"], name: "index_tk81_pameldinger_on_user_id"
  end

  create_table "tk81_skuespillere", force: :cascade do |t|
    t.integer "tk81_pamelding_id", null: false
    t.boolean "samme_rolle"
    t.boolean "vil_danse"
    t.string "klesstorrelse"
    t.string "skostorrelse"
    t.boolean "samtykke"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tk81_pamelding_id"], name: "index_tk81_skuespillere_on_tk81_pamelding_id"
  end

  create_table "tk81_teknikere", force: :cascade do |t|
    t.integer "tk81_pamelding_id", null: false
    t.integer "1valg_id"
    t.integer "2valg_id"
    t.integer "3valg_id"
    t.integer "valgt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["1valg_id"], name: "index_tk81_teknikere_on_1valg_id"
    t.index ["2valg_id"], name: "index_tk81_teknikere_on_2valg_id"
    t.index ["3valg_id"], name: "index_tk81_teknikere_on_3valg_id"
    t.index ["tk81_pamelding_id"], name: "index_tk81_teknikere_on_tk81_pamelding_id"
    t.index ["valgt_id"], name: "index_tk81_teknikere_on_valgt_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.string "title", limit: 255
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", limit: 255, null: false
    t.string "email", limit: 255
    t.string "crypted_password", limit: 255
    t.string "salt", limit: 255
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "remember_me_token", limit: 255
    t.datetime "remember_me_token_expires_at", precision: nil
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_token_expires_at", precision: nil
    t.datetime "reset_password_email_sent_at", precision: nil
    t.string "name", limit: 255
    t.boolean "communication_consent"
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  create_table "volunteers", force: :cascade do |t|
    t.string "name", limit: 255
    t.text "address"
    t.date "birthday"
    t.string "email", limit: 255
    t.string "phone", limit: 255
    t.bigint "group_id"
    t.string "access_level", limit: 255
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "user_id"
    t.bigint "event_id"
    t.index ["event_id"], name: "index_volunteers_on_event_id"
    t.index ["user_id"], name: "index_volunteers_on_user_id"
  end

  add_foreign_key "tk81_pameldinger", "events"
  add_foreign_key "tk81_pameldinger", "groups", column: "foresatte_bidrag_id"
  add_foreign_key "tk81_pameldinger", "users"
  add_foreign_key "tk81_skuespillere", "tk81_pameldinger"
  add_foreign_key "tk81_teknikere", "groups", column: "1valg_id"
  add_foreign_key "tk81_teknikere", "groups", column: "2valg_id"
  add_foreign_key "tk81_teknikere", "groups", column: "3valg_id"
  add_foreign_key "tk81_teknikere", "groups", column: "valgt_id"
  add_foreign_key "tk81_teknikere", "tk81_pameldinger"
end

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

ActiveRecord::Schema.define(version: 2021_06_25_201443) do

  create_table "estimates", force: :cascade do |t|
    t.integer "value", limit: 1, null: false
    t.text "comment", limit: 280
    t.integer "author_id"
    t.integer "target_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id", "target_id"], name: "index_estimates_on_author_id_and_target_id", unique: true
    t.index ["author_id"], name: "index_estimates_on_author_id"
    t.index ["target_id"], name: "index_estimates_on_target_id"
  end

  create_table "gifts", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.integer "recipient_id", null: false
    t.integer "added_by_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["added_by_id"], name: "index_gifts_on_added_by_id"
    t.index ["recipient_id"], name: "index_gifts_on_recipient_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "image"
    t.integer "gift_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gift_id"], name: "index_images_on_gift_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "body", limit: 280, null: false
    t.integer "reviewee_id", null: false
    t.integer "reviewer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reviewee_id"], name: "index_reviews_on_reviewee_id"
    t.index ["reviewer_id"], name: "index_reviews_on_reviewer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.date "birthday"
    t.string "adress"
    t.string "address"
    t.integer "role", limit: 1, default: 0, null: false
    t.text "behavior", limit: 300
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "estimates", "users", column: "author_id"
  add_foreign_key "estimates", "users", column: "target_id"
  add_foreign_key "gifts", "users", column: "added_by_id"
  add_foreign_key "gifts", "users", column: "recipient_id"
  add_foreign_key "images", "gifts"
  add_foreign_key "reviews", "users", column: "reviewee_id"
  add_foreign_key "reviews", "users", column: "reviewer_id"
end

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_13_131718) do

  create_table "likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "petsitter_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["petsitter_id"], name: "index_likes_on_petsitter_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "petsitters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "address", null: false
    t.string "prefecture", null: false
    t.string "town", null: false
    t.string "phone", null: false
    t.string "business_hours"
    t.string "regular_holiday"
    t.string "pet_type", null: false
    t.string "qualification"
    t.string "registration_number"
    t.boolean "insurance", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.string "apartment"
    t.string "block"
    t.index ["email"], name: "index_petsitters_on_email", unique: true
  end

  create_table "reviews", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.float "rate", default: 0.0, null: false
    t.bigint "user_id", null: false
    t.bigint "petsitter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["petsitter_id"], name: "index_reviews_on_petsitter_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "temp_saves", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "petsitter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["petsitter_id"], name: "index_temp_saves_on_petsitter_id"
    t.index ["user_id"], name: "index_temp_saves_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uid"
    t.string "provider"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "likes", "petsitters"
  add_foreign_key "likes", "users"
  add_foreign_key "reviews", "petsitters"
  add_foreign_key "reviews", "users"
  add_foreign_key "temp_saves", "petsitters"
  add_foreign_key "temp_saves", "users"
end

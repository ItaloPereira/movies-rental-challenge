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

ActiveRecord::Schema[7.0].define(version: 2023_07_03_183443) do
  create_table "favorite_movies", id: false, force: :cascade do |t|
    t.integer "movie_id"
    t.integer "user_id"
    t.index ["movie_id"], name: "index_favorite_movies_on_movie_id"
    t.index ["user_id", "movie_id"], name: "index_favorite_movies_on_user_id_and_movie_id", unique: true
    t.index ["user_id"], name: "index_favorite_movies_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title", null: false
    t.string "genre"
    t.float "rating"
    t.integer "available_copies", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rentals", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_rentals_on_movie_id"
    t.index ["user_id", "movie_id"], name: "index_rentals_on_user_id_and_movie_id", unique: true
    t.index ["user_id"], name: "index_rentals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "favorite_movies", "movies"
  add_foreign_key "favorite_movies", "users"
  add_foreign_key "rentals", "movies"
  add_foreign_key "rentals", "users"
end

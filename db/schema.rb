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

ActiveRecord::Schema.define(version: 2021_10_25_163017) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", force: :cascade do |t|
    t.bigint "sport_club_id"
    t.bigint "talent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_club_id"], name: "index_matches_on_sport_club_id"
    t.index ["talent_id"], name: "index_matches_on_talent_id"
  end

  create_table "sport_clubs", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "league"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "zipcode"
    t.string "email"
    t.string "phone"
    t.string "tournaments"
    t.string "coach_resume"
    t.string "currently_looking"
  end

  create_table "talents", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "height"
    t.integer "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "video_url"
    t.integer "zipcode"
    t.string "email"
    t.string "dominant_foot"
    t.integer "goals_made_ls"
    t.float "vertical_jump"
    t.float "forty_dash"
    t.integer "juggling_record"
    t.string "talents"
    t.string "primary_position"
    t.string "secondary_position"
    t.string "awards"
  end

  add_foreign_key "matches", "sport_clubs"
  add_foreign_key "matches", "talents"
end

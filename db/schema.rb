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

ActiveRecord::Schema.define(version: 2018_10_09_083835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.date "dob"
    t.string "email"
    t.string "contact"
    t.text "address"
    t.text "skill"
    t.text "experience"
    t.text "hobbies"
    t.text "long_term_plan"
    t.text "personal_interest"
    t.string "keywords"
    t.string "referrals"
    t.string "upload_file_file_name"
    t.string "upload_file_content_type"
    t.integer "upload_file_file_size"
    t.datetime "upload_file_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

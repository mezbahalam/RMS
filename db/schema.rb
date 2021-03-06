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

ActiveRecord::Schema.define(version: 2018_12_23_042826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "candidate_jobs", force: :cascade do |t|
    t.integer "candidate_id"
    t.integer "job_id"
    t.string "expected_salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id", "job_id"], name: "index_candidate_jobs_on_candidate_id_and_job_id", unique: true
    t.index ["candidate_id"], name: "index_candidate_jobs_on_candidate_id"
    t.index ["job_id"], name: "index_candidate_jobs_on_job_id"
  end

  create_table "candidates", force: :cascade do |t|
    t.string "name", null: false
    t.integer "gender"
    t.date "dob"
    t.string "email", null: false
    t.string "contact"
    t.text "address"
    t.text "skill", null: false
    t.float "experience", null: false
    t.text "hobbies"
    t.text "long_term_plan"
    t.text "personal_interest", null: false
    t.string "keywords"
    t.string "referrals"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "university_name"
    t.string "degree"
    t.string "major"
    t.float "cgpa"
    t.string "passing_year"
    t.index ["user_id"], name: "index_candidates_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.date "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.datetime "email_confirmed_at"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "country"
    t.integer "role", default: 1, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "candidates", "users"
end

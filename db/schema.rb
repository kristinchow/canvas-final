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

ActiveRecord::Schema.define(version: 20171210010907) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "assignments", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "score"
    t.integer  "points"
    t.datetime "duedate"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "submitted"
    t.integer  "course_id"
    t.integer  "grade_id"
    t.integer  "photo_id"
    t.index ["course_id"], name: "index_assignments_on_course_id"
    t.index ["grade_id"], name: "index_assignments_on_grade_id"
    t.index ["photo_id"], name: "index_assignments_on_photo_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "admin_id"
    t.integer  "assignment_id"
    t.index ["admin_id"], name: "index_courses_on_admin_id"
    t.index ["assignment_id"], name: "index_courses_on_assignment_id"
  end

  create_table "courses_users", force: :cascade do |t|
    t.integer "course_id"
    t.integer "user_id"
    t.index ["course_id"], name: "index_courses_users_on_course_id"
    t.index ["user_id"], name: "index_courses_users_on_user_id"
  end

  create_table "grades", force: :cascade do |t|
    t.integer  "score"
    t.integer  "assignment_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.index ["assignment_id"], name: "index_grades_on_assignment_id"
    t.index ["user_id"], name: "index_grades_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "assignment_id"
    t.integer  "user_id"
    t.index ["assignment_id"], name: "index_photos_on_assignment_id"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
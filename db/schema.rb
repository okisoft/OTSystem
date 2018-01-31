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

ActiveRecord::Schema.define(version: 20180115062512) do

  create_table "achievments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "problem_id"
    t.boolean "achieved", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["problem_id"], name: "index_achievments_on_problem_id"
    t.index ["user_id"], name: "index_achievments_on_user_id"
  end

  create_table "group_members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
  end

  create_table "groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
  end

  create_table "lecture_times", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "lecture_year_id", null: false
    t.integer "time", default: 1
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lecture_year_id"], name: "index_lecture_times_on_lecture_year_id"
  end

  create_table "lecture_years", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "lecture_id", null: false
    t.integer "year", null: false
    t.string "style", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lecture_id"], name: "index_lecture_years_on_lecture_id"
  end

  create_table "lectures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "problems", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "lecture_time_id"
    t.string "name"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lecture_time_id"], name: "index_problems_on_lecture_time_id"
  end

  create_table "progresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "lecture_time_id"
    t.bigint "user_id"
    t.integer "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lecture_time_id"], name: "index_progresses_on_lecture_time_id"
    t.index ["user_id"], name: "index_progresses_on_user_id"
  end

  create_table "public_lectures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "lecture_id"
    t.bigint "lecture_time_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lecture_id"], name: "index_public_lectures_on_lecture_id"
    t.index ["lecture_time_id"], name: "index_public_lectures_on_lecture_time_id"
    t.index ["user_id"], name: "index_public_lectures_on_user_id"
  end

  create_table "questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "problem_id"
    t.bigint "user_id"
    t.text "content"
    t.string "reply"
    t.boolean "visible"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["problem_id"], name: "index_questions_on_problem_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id", null: false
    t.bigint "lecture_year_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lecture_year_id"], name: "index_students_on_lecture_year_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "user_id", null: false
    t.string "name", null: false
    t.integer "authority", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "achievments", "problems"
  add_foreign_key "achievments", "users"
  add_foreign_key "lecture_times", "lecture_years"
  add_foreign_key "lecture_years", "lectures"
  add_foreign_key "problems", "lecture_times"
  add_foreign_key "progresses", "lecture_times"
  add_foreign_key "progresses", "users"
  add_foreign_key "public_lectures", "lecture_times"
  add_foreign_key "public_lectures", "lectures"
  add_foreign_key "public_lectures", "users"
  add_foreign_key "questions", "problems"
  add_foreign_key "questions", "users"
  add_foreign_key "students", "lecture_years"
  add_foreign_key "students", "users"
end

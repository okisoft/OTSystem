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

ActiveRecord::Schema.define(version: 20180110011307) do

  create_table "lecture_times", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "lecture_year_id"
    t.integer "time"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lecture_year_id"], name: "index_lecture_times_on_lecture_year_id"
  end

  create_table "lecture_years", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "lecture_id"
    t.integer "year"
    t.integer "style"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lecture_id"], name: "index_lecture_years_on_lecture_id"
  end

  create_table "lectures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "public_lectures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "User_id"
    t.bigint "Lecture_id"
    t.bigint "LectureTime_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["LectureTime_id"], name: "index_public_lectures_on_LectureTime_id"
    t.index ["Lecture_id"], name: "index_public_lectures_on_Lecture_id"
    t.index ["User_id"], name: "index_public_lectures_on_User_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "lecture_times", "lecture_years"
  add_foreign_key "lecture_years", "lectures"
end

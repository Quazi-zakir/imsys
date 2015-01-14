# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150114105531) do

  create_table "course_sections", force: true do |t|
    t.integer  "course_id"
    t.integer  "section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_sections", ["course_id"], name: "index_course_sections_on_course_id", using: :btree
  add_index "course_sections", ["section_id"], name: "index_course_sections_on_section_id", using: :btree

  create_table "courses", force: true do |t|
    t.string   "course_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.string   "section_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_course_sections", force: true do |t|
    t.integer  "course_id"
    t.integer  "section_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "student_course_sections", ["course_id"], name: "index_student_course_sections_on_course_id", using: :btree
  add_index "student_course_sections", ["section_id"], name: "index_student_course_sections_on_section_id", using: :btree
  add_index "student_course_sections", ["student_id"], name: "index_student_course_sections_on_student_id", using: :btree

  create_table "students", force: true do |t|
    t.string   "student_name"
    t.integer  "age"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teacher_course_sections", force: true do |t|
    t.integer  "course_section_id"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teacher_course_sections", ["course_section_id"], name: "index_teacher_course_sections_on_course_section_id", using: :btree
  add_index "teacher_course_sections", ["teacher_id"], name: "index_teacher_course_sections_on_teacher_id", using: :btree

  create_table "teachers", force: true do |t|
    t.string   "teacher_name"
    t.integer  "age"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

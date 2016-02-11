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

ActiveRecord::Schema.define(version: 20141219112501) do

  create_table "entrepreneurs", force: true do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "linkedin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
  end

  add_index "entrepreneurs", ["email"], name: "index_entrepreneurs_on_email", unique: true
  add_index "entrepreneurs", ["remember_token"], name: "index_entrepreneurs_on_remember_token"

  create_table "follows", force: true do |t|
    t.string   "follower_type"
    t.integer  "follower_id"
    t.string   "followable_type"
    t.integer  "followable_id"
    t.datetime "created_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables"
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows"

  create_table "likes", force: true do |t|
    t.string   "liker_type"
    t.integer  "liker_id"
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.datetime "created_at"
  end

  add_index "likes", ["likeable_id", "likeable_type"], name: "fk_likeables"
  add_index "likes", ["liker_id", "liker_type"], name: "fk_likes"

  create_table "mentions", force: true do |t|
    t.string   "mentioner_type"
    t.integer  "mentioner_id"
    t.string   "mentionable_type"
    t.integer  "mentionable_id"
    t.datetime "created_at"
  end

  add_index "mentions", ["mentionable_id", "mentionable_type"], name: "fk_mentionables"
  add_index "mentions", ["mentioner_id", "mentioner_type"], name: "fk_mentions"

  create_table "microposts", force: true do |t|
    t.text     "content"
    t.integer  "startup_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["startup_id", "created_at"], name: "index_microposts_on_startup_id_and_created_at"

  create_table "startups", force: true do |t|
    t.string   "name"
    t.string   "link"
    t.text     "about"
    t.text     "founderinfo"
    t.integer  "entrepreneur_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
    t.string   "location"
    t.string   "funding"
    t.string   "email"
    t.string   "phone"
    t.string   "size"
    t.string   "tagline"
  end

  add_index "startups", ["entrepreneur_id", "created_at"], name: "index_startups_on_entrepreneur_id_and_created_at"

  create_table "students", force: true do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "linkedin_id"
    t.string   "password_digest"
    t.string   "remember_token"
    t.text     "bio"
    t.string   "github"
    t.string   "skills"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
    t.text     "education"
    t.string   "linkedin"
    t.string   "phone"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
  end

  add_index "students", ["email"], name: "index_students_on_email", unique: true
  add_index "students", ["remember_token"], name: "index_students_on_remember_token"

  create_table "users", force: true do |t|
    t.string   "linkedin_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end

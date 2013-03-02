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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130302191129) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "speakers"
    t.datetime "date"
    t.string   "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "notes", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "up_votes",    :default => 0, :null => false
    t.integer  "down_votes",  :default => 0, :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "photo"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "password_digest"
    t.integer  "up_votes",        :default => 0,        :null => false
    t.integer  "down_votes",      :default => 0,        :null => false
    t.string   "user_type",       :default => "normal"
  end

  create_table "votings", :force => true do |t|
    t.string   "voteable_type"
    t.integer  "voteable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "up_vote",       :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "votings", ["voteable_type", "voteable_id", "voter_type", "voter_id"], :name => "unique_voters", :unique => true
  add_index "votings", ["voteable_type", "voteable_id"], :name => "index_votings_on_voteable_type_and_voteable_id"
  add_index "votings", ["voter_type", "voter_id"], :name => "index_votings_on_voter_type_and_voter_id"

end

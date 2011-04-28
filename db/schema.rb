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

ActiveRecord::Schema.define(:version => 20110427234454) do

  create_table "contents", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.text     "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "features", :force => true do |t|
    t.string   "name",        :limit => 32
    t.boolean  "enabled",                     :default => false
    t.string   "description", :limit => 1024
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "features", ["name"], :name => "index_features_on_name", :unique => true

  create_table "imports", :force => true do |t|
    t.string   "datatype"
    t.integer  "processed"
    t.string   "csv_file_name"
    t.string   "csv_content_type"
    t.integer  "csv_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "preregistrations", :force => true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  create_table "rooms", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rooms", ["title"], :name => "index_rooms_on_title", :unique => true

  create_table "schedules", :force => true do |t|
    t.integer  "sesja_id"
    t.integer  "room_id"
    t.integer  "time_slot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sesjas", :force => true do |t|
    t.string   "title"
    t.text     "abstract"
    t.integer  "level"
    t.string   "keywords"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "accepted_at"
    t.datetime "mailed_at"
    t.datetime "rsvped_at"
    t.string   "permalink"
  end

  add_index "sesjas", ["permalink"], :name => "index_sesjas_on_permalink"
  add_index "sesjas", ["title"], :name => "index_sesjas_on_title"

  create_table "sponsors", :force => true do |t|
    t.string   "name"
    t.string   "contact_name"
    t.text     "description"
    t.string   "home_page"
    t.integer  "sponsorship_level_id"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "sponsorship_levels", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "priority"
  end

  create_table "submissions", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "biography"
    t.string   "title"
    t.text     "abstract"
    t.string   "home_page"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.datetime "deleted_at"
    t.integer  "level"
    t.string   "keywords"
  end

  create_table "time_slots", :force => true do |t|
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "time_slots", ["starts_at", "ends_at"], :name => "index_time_slots_on_starts_at_and_ends_at", :unique => true
  add_index "time_slots", ["title"], :name => "index_time_slots_on_title", :unique => true

  create_table "translations", :force => true do |t|
    t.string   "locale"
    t.string   "key"
    t.text     "value"
    t.text     "interpolations"
    t.boolean  "is_proc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                :default => "",      :null => false
    t.string   "encrypted_password",   :limit => 128,  :default => ""
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                                 :default => "guest"
    t.integer  "submissions_id"
    t.string   "home_page"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "biography"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "invitation_token",     :limit => 20
    t.datetime "invitation_sent_at"
    t.string   "speakerrate",          :limit => 2048
    t.string   "twitter",              :limit => 32
    t.string   "permalink"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["first_name", "last_name"], :name => "index_users_on_first_name_and_last_name"
  add_index "users", ["invitation_token"], :name => "index_users_on_invitation_token"
  add_index "users", ["permalink"], :name => "index_users_on_permalink"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

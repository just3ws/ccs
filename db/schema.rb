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

ActiveRecord::Schema.define(:version => 20110403132816) do

  create_table "contents", :force => true do |t|
    t.string    "title"
    t.text      "body"
    t.string    "permalink"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "imports", :force => true do |t|
    t.string    "datatype"
    t.integer   "processed"
    t.string    "csv_file_name"
    t.string    "csv_content_type"
    t.integer   "csv_file_size"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "preregistrations", :force => true do |t|
    t.string    "email"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "status"
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
  end

  create_table "submissions", :force => true do |t|
    t.string    "email"
    t.string    "first_name"
    t.string    "last_name"
    t.text      "biography"
    t.string    "title"
    t.text      "abstract"
    t.string    "home_page"
    t.string    "avatar_file_name"
    t.string    "avatar_content_type"
    t.integer   "avatar_file_size"
    t.timestamp "avatar_updated_at"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "user_id"
    t.timestamp "deleted_at"
    t.integer   "level"
    t.string    "keywords"
  end

  create_table "users", :force => true do |t|
    t.string    "email",                                :default => "",      :null => false
    t.string    "encrypted_password",                   :default => ""
    t.string    "reset_password_token"
    t.string    "remember_token"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",                        :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "role",                                 :default => "guest"
    t.integer   "submissions_id"
    t.string    "home_page"
    t.string    "first_name"
    t.string    "last_name"
    t.text      "biography"
    t.string    "avatar_file_name"
    t.string    "avatar_content_type"
    t.integer   "avatar_file_size"
    t.timestamp "avatar_updated_at"
    t.string    "confirmation_token"
    t.timestamp "confirmed_at"
    t.timestamp "confirmation_sent_at"
    t.string    "invitation_token",     :limit => 20
    t.timestamp "invitation_sent_at"
    t.string    "speakerrate",          :limit => 2048
    t.string    "twitter",              :limit => 32
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["invitation_token"], :name => "index_users_on_invitation_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

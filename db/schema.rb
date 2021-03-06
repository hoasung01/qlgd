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

ActiveRecord::Schema.define(:version => 20131209041604) do

  create_table "calendars", :force => true do |t|
    t.integer  "so_tiet"
    t.integer  "so_tuan"
    t.integer  "thu"
    t.integer  "tiet_bat_dau"
    t.integer  "tuan_hoc_bat_dau"
    t.integer  "lop_mon_hoc_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "calendars", ["lop_mon_hoc_id"], :name => "index_calendars_on_lop_mon_hoc_id"

  create_table "giang_viens", :force => true do |t|
    t.string   "ho"
    t.string   "dem"
    t.string   "ten"
    t.string   "code"
    t.string   "ten_khoa"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lop_mon_hocs", :force => true do |t|
    t.string   "ma_lop"
    t.string   "ma_mon_hoc"
    t.string   "ma_giang_vien"
    t.hstore   "settings"
    t.string   "state"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "giang_vien_id"
  end

  add_index "lop_mon_hocs", ["giang_vien_id"], :name => "index_lop_mon_hocs_on_giang_vien_id"
  add_index "lop_mon_hocs", ["settings"], :name => "index_lop_mon_hocs_on_settings"

  create_table "sinh_viens", :force => true do |t|
    t.string   "ho"
    t.string   "dem"
    t.string   "ten"
    t.datetime "ngay_sinh"
    t.string   "code"
    t.string   "ma_lop_hanh_chinh"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "tenants", :force => true do |t|
    t.string   "hoc_ky"
    t.string   "nam_hoc"
    t.datetime "ngay_bat_dau"
    t.datetime "ngay_ket_thuc"
    t.string   "name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
    t.integer  "imageable_id"
    t.string   "imageable_type"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

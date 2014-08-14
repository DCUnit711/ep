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

ActiveRecord::Schema.define(version: 20140716195800) do

  create_table "comments", force: true do |t|
    t.text     "content"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "employee_id"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"

  create_table "computer_images", force: true do |t|
    t.string   "image"
    t.string   "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "computer_models", force: true do |t|
    t.string   "model"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "computers", force: true do |t|
    t.string   "service_tag"
    t.integer  "computer_model_id", limit: 8
    t.integer  "computer_image_id", limit: 8
    t.string   "vga_dvi"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "print_station_id"
  end

  create_table "copy_centers", force: true do |t|
    t.string   "location"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "devices", force: true do |t|
    t.string   "device_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.string   "name"
    t.integer  "copy_center_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventories", force: true do |t|
    t.string   "description"
    t.integer  "location_id",       limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "printer_id",        limit: 8
    t.integer  "inventory_type_id"
    t.integer  "printer_model_id"
  end

  create_table "inventory_types", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "inv_type"
  end

  create_table "issue_received_methods", force: true do |t|
    t.string   "method"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issue_types", force: true do |t|
    t.integer  "device_id"
    t.string   "issue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "location"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", force: true do |t|
    t.string   "comment"
    t.integer  "employee_id"
    t.integer  "comment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["comment_id"], name: "index_notes_on_comment_id"

  create_table "passdowns", force: true do |t|
    t.text     "body"
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "print_stations", force: true do |t|
    t.string   "location_id"
    t.string   "location"
    t.string   "building"
    t.string   "room_number"
    t.string   "computer_jack"
    t.boolean  "printer_our_jack"
    t.boolean  "computer_our_jack"
    t.boolean  "strapped_down"
    t.boolean  "restricted_access"
    t.string   "key_code"
    t.boolean  "keyboard"
    t.boolean  "mouse"
    t.boolean  "touchpad"
    t.string   "monitor"
    t.integer  "status_id",         limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "copy_center_id"
  end

  create_table "printer_models", force: true do |t|
    t.string   "model"
    t.string   "service_code"
    t.string   "black"
    t.string   "cyan"
    t.string   "magenta"
    t.string   "yellow"
    t.string   "fuser"
    t.string   "maint_kit"
    t.string   "transfer_kit"
    t.string   "collection_unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "printers", force: true do |t|
    t.string   "serial_number"
    t.integer  "printer_model_id",             limit: 8
    t.string   "color_bw"
    t.string   "webjet_model"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ps_connection_information_id"
    t.integer  "status_id"
  end

  create_table "ps_connection_informations", force: true do |t|
    t.integer  "print_station_id"
    t.string   "ip_address"
    t.string   "jack"
    t.string   "pharos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: true do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sysdiagrams", primary_key: "diagram_id", force: true do |t|
    t.string  "name",         limit: 128, null: false
    t.integer "principal_id",             null: false
    t.integer "version"
    t.binary  "definition"
  end

  add_index "sysdiagrams", ["principal_id", "name"], name: "UK_principal_name", unique: true

  create_table "ticket_issues", force: true do |t|
    t.integer  "ticket_id"
    t.integer  "issue_type_id"
    t.text     "description"
    t.integer  "issue_received_method_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "issue_severity"
    t.datetime "resolved_at"
    t.integer  "resolved_employee_id"
    t.text     "resolution_notes"
  end

  create_table "tickets", force: true do |t|
    t.integer  "created_employee_id"
    t.integer  "ticketable_id"
    t.string   "ticketable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tickets", ["ticketable_id", "ticketable_type"], name: "index_tickets_on_ticketable_id_and_ticketable_type"

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end

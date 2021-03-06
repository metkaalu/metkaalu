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

ActiveRecord::Schema.define(:version => 20110329134310) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_categories", :force => true do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_images", :force => true do |t|
    t.string   "caption"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "position"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "price"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "store_id"
  end

  create_table "store_categories", :force => true do |t|
    t.integer  "store_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stores", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "address"
    t.string   "state"
    t.string   "city"
    t.string   "zip"
    t.string   "phone"
    t.string   "currency"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer  "country_id"
    t.string   "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "full_name",       :limit => 100
    t.string   "email",                          :default => "", :null => false
    t.string   "hashed_password", :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt"
    t.string   "username"
  end

end

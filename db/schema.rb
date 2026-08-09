# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2026_08_09_091000) do
  create_table "account_transactions", force: :cascade do |t|
    t.integer "account_id", null: false
    t.string "transaction_type", null: false
    t.decimal "amount", precision: 19, scale: 4, null: false
    t.string "description", null: false
    t.datetime "transaction_date", default: -> { "CURRENT_TIMESTAMP" }
    t.decimal "balance_after", precision: 19, scale: 4
    t.string "reference_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_account_transactions_on_account_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.string "account_number", null: false
    t.string "account_type", null: false
    t.string "account_status", default: "ACTIVE", null: false
    t.string "currency_code", default: "USD", null: false
    t.decimal "balance", precision: 19, scale: 4, default: "0.0", null: false
    t.decimal "available_balance", precision: 19, scale: 4, default: "0.0", null: false
    t.decimal "interest_rate", precision: 7, scale: 4, default: "0.0"
    t.decimal "overdraft_limit", precision: 19, scale: 4, default: "0.0", null: false
    t.datetime "opened_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "closed_at"
    t.integer "branch_id"
    t.boolean "is_joint_account", default: false, null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_number"], name: "index_accounts_on_account_number", unique: true
    t.index ["customer_id"], name: "index_accounts_on_customer_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "assets", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bets", force: :cascade do |t|
    t.float "amount"
    t.integer "match_id"
    t.boolean "yes_not"
    t.float "bet_reading"
    t.integer "score"
    t.integer "wicket"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bets_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.string "mobile"
    t.string "email"
    t.string "address"
    t.string "dob"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_contacts_on_role_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "customer_number", null: false
    t.string "customer_type", null: false
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "business_name"
    t.date "date_of_birth"
    t.string "gender"
    t.string "nationality"
    t.string "status", default: "active", null: false
    t.date "customer_since", null: false
    t.integer "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_number"], name: "index_customers_on_customer_number", unique: true
  end

  create_table "nominees", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "description"
    t.string "image_url"
    t.string "aadhar_number"
    t.string "pan_number"
    t.string "mobile_number"
    t.string "email"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "pincode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.text "address"
    t.string "mobile"
    t.string "pincode"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["email"], name: "index_profiles_on_email", unique: true
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_roles_on_user_id"
  end

  create_table "sellers", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "phone"
    t.text "description"
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_sellers_on_email", unique: true
  end

  create_table "tickets", force: :cascade do |t|
    t.string "title", null: false
    t.integer "project_id", null: false
    t.text "description"
    t.integer "user_id", null: false
    t.string "status", default: "open", null: false
    t.integer "priority", default: 0, null: false
    t.string "category"
    t.string "assigned_to"
    t.datetime "due_date"
    t.string "ticket_number", null: false
    t.string "location"
    t.integer "closed_by"
    t.integer "closed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.integer "mobile"
    t.boolean "is_whatsapp", default: false, null: false
    t.string "address", default: "", null: false
    t.string "dob", default: "", null: false
    t.string "gender", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "account_transactions", "accounts"
  add_foreign_key "accounts", "customers"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "profiles", "users"
  add_foreign_key "tickets", "users"
end

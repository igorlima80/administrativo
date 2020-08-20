# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_18_131538) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "agency"
    t.string "number"
    t.string "operation"
    t.bigint "bank_id"
    t.bigint "bank_account_type_id"
    t.string "accountable_type"
    t.bigint "accountable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accountable_type", "accountable_id"], name: "index_accounts_on_accountable_type_and_accountable_id"
    t.index ["bank_account_type_id"], name: "index_accounts_on_bank_account_type_id"
    t.index ["bank_id"], name: "index_accounts_on_bank_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "description"
    t.string "zipcode"
    t.string "street"
    t.string "number"
    t.string "complement"
    t.string "district"
    t.bigint "city_id"
    t.string "gia"
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
    t.index ["city_id"], name: "index_addresses_on_city_id"
  end

  create_table "bank_account_types", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banks", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bidding_items", force: :cascade do |t|
    t.bigint "bidding_id"
    t.bigint "product_id"
    t.bigint "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bidding_id"], name: "index_bidding_items_on_bidding_id"
    t.index ["product_id"], name: "index_bidding_items_on_product_id"
    t.index ["task_id"], name: "index_bidding_items_on_task_id"
  end

  create_table "biddings", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_biddings_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "ibgeid"
    t.string "gia"
    t.bigint "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "components", force: :cascade do |t|
    t.integer "quantity"
    t.integer "unit_value_cents", default: 0, null: false
    t.string "unit_value_currency", default: "BRL", null: false
    t.bigint "product_id"
    t.bigint "entry_id"
    t.bigint "lot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.bigint "component_id"
    t.string "kind"
    t.integer "solicited_quantity"
    t.bigint "order_id"
    t.index ["category_id"], name: "index_components_on_category_id"
    t.index ["component_id"], name: "index_components_on_component_id"
    t.index ["entry_id"], name: "index_components_on_entry_id"
    t.index ["lot_id"], name: "index_components_on_lot_id"
    t.index ["order_id"], name: "index_components_on_order_id"
    t.index ["product_id"], name: "index_components_on_product_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.datetime "moment"
    t.bigint "provider_id"
    t.bigint "user_id"
    t.bigint "unit_id"
    t.bigint "task_id"
    t.bigint "entry_id"
    t.integer "value_cents", default: 0, null: false
    t.string "value_currency", default: "BRL", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entry_id"], name: "index_contracts_on_entry_id"
    t.index ["provider_id"], name: "index_contracts_on_provider_id"
    t.index ["task_id"], name: "index_contracts_on_task_id"
    t.index ["unit_id"], name: "index_contracts_on_unit_id"
    t.index ["user_id"], name: "index_contracts_on_user_id"
  end

  create_table "document_types", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string "number"
    t.date "emission"
    t.string "department"
    t.bigint "state_id"
    t.bigint "document_type_id"
    t.string "documentable_type"
    t.bigint "documentable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_type_id"], name: "index_documents_on_document_type_id"
    t.index ["documentable_type", "documentable_id"], name: "index_documents_on_documentable_type_and_documentable_id"
    t.index ["state_id"], name: "index_documents_on_state_id"
  end

  create_table "entries", force: :cascade do |t|
    t.bigint "unit_id"
    t.integer "value_cents", default: 0, null: false
    t.string "value_currency", default: "BRL", null: false
    t.string "kind"
    t.datetime "moment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "entry_description_id"
    t.index ["entry_description_id"], name: "index_entries_on_entry_description_id"
    t.index ["unit_id"], name: "index_entries_on_unit_id"
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "entry_descriptions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lots", force: :cascade do |t|
    t.string "kind"
    t.datetime "moment"
    t.bigint "user_id"
    t.bigint "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["unit_id"], name: "index_lots_on_unit_id"
    t.index ["user_id"], name: "index_lots_on_user_id"
  end

  create_table "menu_items", force: :cascade do |t|
    t.string "name"
    t.string "link"
    t.string "icon"
    t.boolean "published"
    t.integer "position"
    t.string "target"
    t.string "active_test"
    t.string "permission"
    t.string "permission_check"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "menu_item_id"
    t.index ["menu_item_id"], name: "index_menu_items_on_menu_item_id"
    t.index ["position"], name: "index_menu_items_on_position"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "moment"
    t.bigint "provider_id"
    t.bigint "user_id"
    t.bigint "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_orders_on_provider_id"
    t.index ["unit_id"], name: "index_orders_on_unit_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "name"
    t.string "object"
    t.string "position"
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_permissions_on_profile_id"
  end

  create_table "phone_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string "number"
    t.bigint "phone_type_id"
    t.string "phonable_type"
    t.bigint "phonable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phonable_type", "phonable_id"], name: "index_phones_on_phonable_type_and_phonable_id"
    t.index ["phone_type_id"], name: "index_phones_on_phone_type_id"
  end

  create_table "prices", force: :cascade do |t|
    t.bigint "quotation_id"
    t.bigint "product_id"
    t.bigint "task_id"
    t.integer "value_cents", default: 0, null: false
    t.string "value_currency", default: "BRL", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_prices_on_product_id"
    t.index ["quotation_id"], name: "index_prices_on_quotation_id"
    t.index ["task_id"], name: "index_prices_on_task_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.string "unity"
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.string "nickname"
    t.string "cpf"
    t.string "cnpj"
    t.string "email"
    t.date "register"
    t.string "principal_seller"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotations", force: :cascade do |t|
    t.date "register"
    t.integer "shipping_cents", default: 0, null: false
    t.string "shipping_currency", default: "BRL", null: false
    t.integer "term"
    t.bigint "provider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_quotations_on_provider_id"
  end

  create_table "responsabilities", force: :cascade do |t|
    t.bigint "profile_id"
    t.bigint "user_id"
    t.bigint "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_responsabilities_on_profile_id"
    t.index ["unit_id"], name: "index_responsabilities_on_unit_id"
    t.index ["user_id"], name: "index_responsabilities_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "ibgeid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supplies", force: :cascade do |t|
    t.bigint "provider_id"
    t.string "suppliable_type"
    t.bigint "suppliable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_supplies_on_provider_id"
    t.index ["suppliable_type", "suppliable_id"], name: "index_supplies_on_suppliable_type_and_suppliable_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.boolean "warehouse", default: false
    t.index ["ancestry"], name: "index_units_on_ancestry"
    t.index ["parent_id"], name: "index_units_on_parent_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.jsonb "object"
    t.datetime "created_at"
    t.jsonb "object_changes"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "accounts", "bank_account_types"
  add_foreign_key "accounts", "banks"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "cities"
  add_foreign_key "bidding_items", "biddings"
  add_foreign_key "bidding_items", "products"
  add_foreign_key "bidding_items", "tasks"
  add_foreign_key "biddings", "users"
  add_foreign_key "cities", "states"
  add_foreign_key "components", "categories"
  add_foreign_key "components", "components"
  add_foreign_key "components", "entries"
  add_foreign_key "components", "lots"
  add_foreign_key "components", "orders"
  add_foreign_key "components", "products"
  add_foreign_key "contracts", "entries"
  add_foreign_key "contracts", "providers"
  add_foreign_key "contracts", "tasks"
  add_foreign_key "contracts", "units"
  add_foreign_key "contracts", "users"
  add_foreign_key "documents", "document_types"
  add_foreign_key "documents", "states"
  add_foreign_key "entries", "entry_descriptions"
  add_foreign_key "entries", "units"
  add_foreign_key "entries", "users"
  add_foreign_key "lots", "units"
  add_foreign_key "lots", "users"
  add_foreign_key "menu_items", "menu_items"
  add_foreign_key "orders", "providers"
  add_foreign_key "orders", "units"
  add_foreign_key "orders", "users"
  add_foreign_key "permissions", "profiles"
  add_foreign_key "phones", "phone_types"
  add_foreign_key "prices", "products"
  add_foreign_key "prices", "quotations"
  add_foreign_key "prices", "tasks"
  add_foreign_key "products", "categories"
  add_foreign_key "quotations", "providers"
  add_foreign_key "responsabilities", "profiles"
  add_foreign_key "responsabilities", "units"
  add_foreign_key "responsabilities", "users"
  add_foreign_key "supplies", "providers"
  add_foreign_key "units", "units", column: "parent_id"
end

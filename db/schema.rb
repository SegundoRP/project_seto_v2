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

ActiveRecord::Schema[7.1].define(version: 2024_05_03_045959) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consultations", force: :cascade do |t|
    t.datetime "date", null: false
    t.integer "status", default: 0, null: false
    t.text "summary"
    t.string "reason_consultation"
    t.bigint "doctor_id", null: false
    t.bigint "patient_id", null: false
    t.bigint "type_of_service_id", null: false
    t.decimal "price", precision: 7, scale: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_consultations_on_doctor_id"
    t.index ["patient_id"], name: "index_consultations_on_patient_id"
    t.index ["type_of_service_id"], name: "index_consultations_on_type_of_service_id"
  end

  create_table "diagnostics", force: :cascade do |t|
    t.text "description", null: false
    t.bigint "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_diagnostics_on_patient_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.integer "age"
    t.string "profession", null: false
    t.string "specialty"
    t.string "college_number"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_doctors_on_user_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.integer "age"
    t.string "email"
    t.string "diagnostic"
    t.string "phone", null: false
    t.string "address"
    t.string "civil_state"
    t.integer "children"
    t.string "instruction_grade"
    t.string "occupation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "therapeutic_histories", force: :cascade do |t|
    t.boolean "first_time_attention"
    t.string "previous_diagnostic"
    t.text "events_in_life"
    t.text "previous_treatment"
    t.text "familiar_antecedents"
    t.bigint "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_therapeutic_histories_on_patient_id"
  end

  create_table "treatments", force: :cascade do |t|
    t.interval "duration", null: false
    t.date "start_time", null: false
    t.text "about", null: false
    t.bigint "diagnostic_id", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diagnostic_id"], name: "index_treatments_on_diagnostic_id"
  end

  create_table "type_of_services", force: :cascade do |t|
    t.string "name_of_service", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "username", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "consultations", "doctors"
  add_foreign_key "consultations", "patients"
  add_foreign_key "consultations", "type_of_services"
  add_foreign_key "diagnostics", "patients"
  add_foreign_key "doctors", "users"
  add_foreign_key "therapeutic_histories", "patients"
  add_foreign_key "treatments", "diagnostics"
end

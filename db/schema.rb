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

ActiveRecord::Schema.define(version: 20181210192402) do

  create_table "credential_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credential_versions", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "encrypted_password"
    t.string "encrypted_password_iv"
    t.string "key"
    t.bigint "credential_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "domain_id"
    t.index ["credential_id"], name: "index_credential_versions_on_credential_id"
    t.index ["domain_id"], name: "index_credential_versions_on_domain_id"
  end

  create_table "credentials", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "env_type_id"
    t.bigint "credential_group_id"
    t.index ["credential_group_id"], name: "index_credentials_on_credential_group_id"
    t.index ["env_type_id"], name: "index_credentials_on_env_type_id"
  end

  create_table "default_logins", force: :cascade do |t|
    t.string "name"
    t.bigint "credential_group_id"
    t.bigint "version_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["credential_group_id"], name: "index_default_logins_on_credential_group_id"
    t.index ["version_id"], name: "index_default_logins_on_version_id"
  end

  create_table "dependee_masks", force: :cascade do |t|
    t.string "version_regex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dependency_id"
    t.bigint "dependee_id"
    t.index ["dependee_id"], name: "index_dependee_masks_on_dependee_id"
    t.index ["dependency_id"], name: "index_dependee_masks_on_dependency_id"
  end

  create_table "dependencies", force: :cascade do |t|
    t.string "name"
    t.string "comment"
    t.string "depender_type"
    t.bigint "depender_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "trigger_id"
    t.bigint "sequence_id"
    t.index ["depender_id"], name: "index_dependencies_on_depender_id"
  end

  create_table "deploy_logs", force: :cascade do |t|
    t.bigint "env_version_id"
    t.boolean "deployed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["env_version_id"], name: "index_deploy_logs_on_env_version_id"
  end

  create_table "deploy_plan_items", force: :cascade do |t|
    t.bigint "deploy_plan_id"
    t.integer "order"
    t.bigint "after_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "instance_id"
    t.index ["deploy_plan_id"], name: "index_deploy_plan_items_on_deploy_plan_id"
  end

  create_table "deploy_plans", force: :cascade do |t|
    t.bigint "env_version_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["env_version_id"], name: "index_deploy_plans_on_env_version_id"
  end

  create_table "deployables", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "domains", force: :cascade do |t|
    t.string "name"
    t.string "netbios"
    t.string "dns"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "env_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "env_versions", force: :cascade do |t|
    t.string "name"
    t.string "account"
    t.string "description"
    t.bigint "environment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "env_type_id"
    t.index ["env_type_id"], name: "index_env_versions_on_env_type_id"
    t.index ["environment_id"], name: "index_env_versions_on_environment_id"
  end

  create_table "environments", force: :cascade do |t|
    t.string "name"
    t.bigint "deployed_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "files", force: :cascade do |t|
    t.string "path"
    t.string "filename"
    t.integer "size"
    t.datetime "file_created"
    t.datetime "file_updated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.bigint "share_id"
    t.index ["share_id"], name: "index_files_on_share_id"
  end

  create_table "implementations", force: :cascade do |t|
    t.bigint "env_version_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "changed_in_id"
    t.index ["changed_in_id"], name: "index_implementations_on_changed_in_id"
    t.index ["env_version_id"], name: "index_implementations_on_env_version_id"
  end

  create_table "inclusions", force: :cascade do |t|
    t.bigint "ru_version_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "version_id"
    t.index ["ru_version_id"], name: "index_inclusions_on_ru_version_id"
  end

  create_table "instances", force: :cascade do |t|
    t.bigint "version_id"
    t.bigint "env_version_id"
    t.bigint "ru_instance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "implementation_id"
    t.bigint "server_id"
    t.index ["env_version_id"], name: "index_instances_on_env_version_id"
    t.index ["implementation_id"], name: "index_instances_on_implementation_id"
    t.index ["ru_instance_id"], name: "index_instances_on_ru_instance_id"
    t.index ["server_id"], name: "index_instances_on_server_id"
    t.index ["version_id"], name: "index_instances_on_version_id"
  end

  create_table "logins", force: :cascade do |t|
    t.string "name"
    t.bigint "credential_version_id"
    t.bigint "instance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["credential_version_id"], name: "index_logins_on_credential_version_id"
    t.index ["instance_id"], name: "index_logins_on_instance_id"
  end

  create_table "logs", force: :cascade do |t|
    t.bigint "deploy_log_id"
    t.bigint "instance_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deploy_log_id"], name: "index_logs_on_deploy_log_id"
    t.index ["instance_id"], name: "index_logs_on_instance_id"
  end

  create_table "packages", force: :cascade do |t|
    t.integer "order"
    t.bigint "file_id"
    t.bigint "version_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["file_id"], name: "index_packages_on_file_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.string "content"
    t.boolean "overridable"
    t.string "owner_type"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_type", "owner_id"], name: "index_properties_on_owner_type_and_owner_id"
  end

  create_table "release_units", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ru_instances", force: :cascade do |t|
    t.bigint "ru_version_id"
    t.bigint "env_version_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["env_version_id"], name: "index_ru_instances_on_env_version_id"
    t.index ["ru_version_id"], name: "index_ru_instances_on_ru_version_id"
  end

  create_table "ru_versions", force: :cascade do |t|
    t.string "name"
    t.bigint "release_unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["release_unit_id"], name: "index_ru_versions_on_release_unit_id"
  end

  create_table "scripts", force: :cascade do |t|
    t.integer "order"
    t.string "category"
    t.bigint "file_id"
    t.bigint "version_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["file_id"], name: "index_scripts_on_file_id"
  end

  create_table "selections", force: :cascade do |t|
    t.bigint "implementation_id"
    t.bigint "dependency_id"
    t.bigint "env_version_id"
    t.bigint "selected_id"
    t.boolean "ambiguous"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dependency_id"], name: "index_selections_on_dependency_id"
    t.index ["env_version_id"], name: "index_selections_on_env_version_id"
    t.index ["implementation_id"], name: "index_selections_on_implementation_id"
    t.index ["selected_id"], name: "index_selections_on_selected_id"
  end

  create_table "sequences", force: :cascade do |t|
    t.string "name"
    t.boolean "after"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "servers", force: :cascade do |t|
    t.string "name"
    t.bigint "domain_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["domain_id"], name: "index_servers_on_domain_id"
  end

  create_table "shares", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "credential_version_id"
    t.string "subpath"
    t.index ["credential_version_id"], name: "index_shares_on_credential_version_id"
  end

  create_table "sysdiagrams", primary_key: "diagram_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.integer "principal_id", null: false
    t.integer "version"
    t.binary "definition"
    t.index ["principal_id", "name"], name: "UK_principal_name", unique: true
  end

  create_table "templates", force: :cascade do |t|
    t.bigint "file_id"
    t.string "path"
    t.bigint "version_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["file_id"], name: "index_templates_on_file_id"
  end

  create_table "triggers", force: :cascade do |t|
    t.string "name"
    t.boolean "lead"
    t.boolean "follow"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "variant_requirements", force: :cascade do |t|
    t.bigint "variant_id"
    t.bigint "dependee_mask_id"
    t.boolean "not"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dependee_mask_id"], name: "index_variant_requirements_on_dependee_mask_id"
    t.index ["variant_id"], name: "index_variant_requirements_on_variant_id"
  end

  create_table "variant_versions", force: :cascade do |t|
    t.bigint "variant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "version_id"
    t.index ["variant_id"], name: "index_variant_versions_on_variant_id"
  end

  create_table "variants", force: :cascade do |t|
    t.string "name"
    t.bigint "deployable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deployable_id"], name: "index_variants_on_deployable_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string "name"
    t.bigint "deployable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deployable_id"], name: "index_versions_on_deployable_id"
  end

  add_foreign_key "credential_versions", "credentials"
  add_foreign_key "credential_versions", "domains"
  add_foreign_key "credentials", "credential_groups"
  add_foreign_key "credentials", "env_types"
  add_foreign_key "default_logins", "credential_groups"
  add_foreign_key "default_logins", "versions"
  add_foreign_key "dependee_masks", "dependencies"
  add_foreign_key "dependee_masks", "deployables", column: "dependee_id"
  add_foreign_key "dependencies", "triggers"
  add_foreign_key "dependencies", "versions", column: "depender_id"
  add_foreign_key "deploy_logs", "env_versions"
  add_foreign_key "deploy_plan_items", "deploy_plans"
  add_foreign_key "deploy_plan_items", "instances"
  add_foreign_key "deploy_plan_items", "instances", column: "after_item_id"
  add_foreign_key "deploy_plans", "env_versions"
  add_foreign_key "env_versions", "env_types"
  add_foreign_key "env_versions", "environments"
  add_foreign_key "files", "shares"
  add_foreign_key "implementations", "env_versions"
  add_foreign_key "implementations", "env_versions", column: "changed_in_id"
  add_foreign_key "inclusions", "ru_versions"
  add_foreign_key "inclusions", "versions"
  add_foreign_key "instances", "env_versions"
  add_foreign_key "instances", "implementations"
  add_foreign_key "instances", "ru_instances"
  add_foreign_key "instances", "servers"
  add_foreign_key "instances", "versions"
  add_foreign_key "logins", "credential_versions"
  add_foreign_key "logins", "instances"
  add_foreign_key "logs", "deploy_logs"
  add_foreign_key "logs", "instances"
  add_foreign_key "packages", "files"
  add_foreign_key "packages", "versions"
  add_foreign_key "ru_instances", "env_versions"
  add_foreign_key "ru_instances", "ru_versions"
  add_foreign_key "ru_versions", "release_units"
  add_foreign_key "scripts", "files"
  add_foreign_key "scripts", "versions"
  add_foreign_key "selections", "dependencies"
  add_foreign_key "selections", "env_versions"
  add_foreign_key "selections", "implementations"
  add_foreign_key "selections", "instances", column: "selected_id"
  add_foreign_key "servers", "domains"
  add_foreign_key "shares", "credential_versions"
  add_foreign_key "templates", "files"
  add_foreign_key "templates", "versions"
  add_foreign_key "variant_requirements", "dependee_masks"
  add_foreign_key "variant_requirements", "variants"
  add_foreign_key "variant_versions", "variants"
  add_foreign_key "variant_versions", "versions"
  add_foreign_key "variants", "deployables"
  add_foreign_key "versions", "deployables"
end

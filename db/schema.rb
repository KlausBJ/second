# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema
# definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more
# migrations you'll amass, the slower it'll run and the greater likelihood for
# issues).
#
# It's strongly recommended that you check this file into your version control
# system.

ActiveRecord::Schema.define(version: 20181010132707) do
  create_table 'app_instances', force: :cascade do |t|
    t.bigint 'app_version_id'
    t.bigint 'env_version_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'ru_instance_id'
    t.index ['app_version_id'], name: 'index_app_instances_on_app_version_id'
    t.index ['env_version_id'], name: 'index_app_instances_on_env_version_id'
    t.index ['ru_instance_id'], name: 'index_app_instances_on_ru_instance_id'
  end

  create_table 'app_versions', force: :cascade do |t|
    t.string 'version'
    t.bigint 'app_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['app_id'], name: 'index_app_versions_on_app_id'
  end

  create_table 'apps', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'db_instances', force: :cascade do |t|
    t.bigint 'db_version_id'
    t.bigint 'env_version_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'ru_instance_id'
    t.index ['db_version_id'], name: 'index_db_instances_on_db_version_id'
    t.index ['env_version_id'], name: 'index_db_instances_on_env_version_id'
    t.index ['ru_instance_id'], name: 'index_db_instances_on_ru_instance_id'
  end

  create_table 'db_versions', force: :cascade do |t|
    t.string 'version'
    t.bigint 'db_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['db_id'], name: 'index_db_versions_on_db_id'
  end

  create_table 'dbs', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'dependee_masks', force: :cascade do |t|
    t.bigint 'interface_id'
    t.boolean 'interface_not'
    t.string 'version_regex'
    t.string 'dependee_entity_type'
    t.bigint 'dependee_entity_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'dependency_id'
    t.index %w[dependee_entity_type dependee_entity_id], name:
      'dependee_mask_dependee_entity__type_and_id'
    t.index ['dependency_id'], name: 'index_dependee_masks_on_dependency_id'
    t.index ['interface_id'], name: 'index_dependee_masks_on_interface_id'
  end

  create_table 'dependencies', force: :cascade do |t|
    t.string 'name'
    t.string 'comment'
    t.string 'depender_type'
    t.bigint 'depender_id'
    t.bigint 'deploy_sequence_id'
    t.bigint 'deploy_trigger_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[depender_type depender_id], name:
      'index_dependencies_on_depender_type_and_depender_id'
    t.index ['deploy_sequence_id'], name:
      'index_dependencies_on_deploy_sequence_id'
    t.index ['deploy_trigger_id'], name:
      'index_dependencies_on_deploy_trigger_id'
  end

  create_table 'deploy_logs', force: :cascade do |t|
    t.bigint 'env_version_id'
    t.text 'content'
    t.boolean 'deployed'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['env_version_id'], name: 'index_deploy_logs_on_env_version_id'
  end

  create_table 'deploy_plan_items', force: :cascade do |t|
    t.bigint 'deploy_plan_id'
    t.integer 'order'
    t.string 'after_item_type'
    t.bigint 'after_item_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'entity_instance_type'
    t.bigint 'entity_instance_id'
    t.index %w[after_item_type after_item_id], name:
      'index_deploy_plan_items_on_after_item_type_and_after_item_id'
    t.index ['deploy_plan_id'], name:
      'index_deploy_plan_items_on_deploy_plan_id'
    t.index %w[entity_instance_type entity_instance_id], name:
      'index_deploy_plan_items_on_entity_instance_type_and_entity_instance_id'
  end

  create_table 'deploy_plans', force: :cascade do |t|
    t.bigint 'env_version_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['env_version_id'], name: 'index_deploy_plans_on_env_version_id'
  end

  create_table 'deploy_sequences', force: :cascade do |t|
    t.string 'name'
    t.boolean 'after'
    t.string 'comment'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'deploy_triggers', force: :cascade do |t|
    t.string 'name'
    t.integer 'mask'
    t.string 'comment'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'entity_logs', force: :cascade do |t|
    t.bigint 'deploy_log_id'
    t.string 'entity_instance_type'
    t.bigint 'entity_instance_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['deploy_log_id'], name: 'index_entity_logs_on_deploy_log_id'
    t.index %w[entity_instance_type entity_instance_id], name:
      'index_entity_logs_on_entity_instance_type_and_entity_instance_id'
  end

  create_table 'env_versions', force: :cascade do |t|
    t.string 'version'
    t.string 'account'
    t.string 'description'
    t.bigint 'environment_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['environment_id'], name: 'index_env_versions_on_environment_id'
  end

  create_table 'environments', force: :cascade do |t|
    t.string 'name'
    t.integer 'deployed_version'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'file_objects', force: :cascade do |t|
    t.string 'path'
    t.string 'filename'
    t.integer 'size'
    t.datetime 'file_created'
    t.datetime 'file_updated'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'inclusions', force: :cascade do |t|
    t.bigint 'ru_version_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'entity_version_type'
    t.bigint 'entity_version_id'
    t.index %w[entity_version_type entity_version_id], name:
      'index_inclusions_on_entity_version_type_and_entity_version_id'
    t.index ['ru_version_id'], name: 'index_inclusions_on_ru_version_id'
  end

  create_table 'interface_mappings', force: :cascade do |t|
    t.bigint 'interface_id'
    t.string 'entity_version_type'
    t.bigint 'entity_version_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[entity_version_type entity_version_id], name:
      'interface_mapping_entity_version__type_and_id'
    t.index ['interface_id'], name: 'index_interface_mappings_on_interface_id'
  end

  create_table 'interfaces', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'entity_type'
    t.bigint 'entity_id'
    t.index %w[entity_type entity_id], name:
      'index_interfaces_on_entity_type_and_entity_id'
  end

  create_table 'packages', force: :cascade do |t|
    t.integer 'order'
    t.bigint 'file_object_id'
    t.string 'entity_version_type'
    t.bigint 'entity_version_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[entity_version_type entity_version_id], name:
      'index_packages_on_entity_version_type_and_entity_version_id'
    t.index ['file_object_id'], name: 'index_packages_on_file_object_id'
  end

  create_table 'properties', force: :cascade do |t|
    t.string 'name'
    t.string 'content'
    t.boolean 'overridable'
    t.string 'owner_type'
    t.bigint 'owner_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[owner_type owner_id], name:
      'index_properties_on_owner_type_and_owner_id'
  end

  create_table 'release_units', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'ru_instances', force: :cascade do |t|
    t.bigint 'ru_version_id'
    t.bigint 'env_version_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['env_version_id'], name: 'index_ru_instances_on_env_version_id'
    t.index ['ru_version_id'], name: 'index_ru_instances_on_ru_version_id'
  end

  create_table 'ru_versions', force: :cascade do |t|
    t.string 'version'
    t.bigint 'release_unit_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['release_unit_id'], name: 'index_ru_versions_on_release_unit_id'
  end

  create_table 'scripts', force: :cascade do |t|
    t.integer 'order'
    t.string 'category'
    t.bigint 'file_object_id'
    t.string 'entity_version_type'
    t.bigint 'entity_version_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[entity_version_type entity_version_id], name:
      'index_scripts_on_entity_version_type_and_entity_version_id'
    t.index ['file_object_id'], name: 'index_scripts_on_file_object_id'
  end

  create_table 'sysdiagrams', primary_key: 'diagram_id', id: :integer, force:
    :cascade do |t|
    t.string 'name', limit: 128, null: false
    t.integer 'principal_id', null: false
    t.integer 'version'
    t.binary 'definition'
    t.index %w[principal_id name], name: 'UK_principal_name', unique: true
  end

  create_table 'templates', force: :cascade do |t|
    t.bigint 'file_object_id'
    t.string 'path'
    t.string 'entity_version_type'
    t.bigint 'entity_version_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[entity_version_type entity_version_id], name:
      'index_templates_on_entity_version_type_and_entity_version_id'
    t.index ['file_object_id'], name: 'index_templates_on_file_object_id'
  end

  add_foreign_key 'app_instances', 'app_versions'
  add_foreign_key 'app_instances', 'env_versions'
  add_foreign_key 'app_instances', 'ru_instances'
  add_foreign_key 'app_versions', 'apps'
  add_foreign_key 'db_instances', 'db_versions'
  add_foreign_key 'db_instances', 'env_versions'
  add_foreign_key 'db_instances', 'ru_instances'
  add_foreign_key 'db_versions', 'dbs'
  add_foreign_key 'dependee_masks', 'dependencies'
  add_foreign_key 'dependee_masks', 'interfaces'
  add_foreign_key 'dependencies', 'deploy_sequences'
  add_foreign_key 'dependencies', 'deploy_triggers'
  add_foreign_key 'deploy_logs', 'env_versions'
  add_foreign_key 'deploy_plan_items', 'deploy_plans'
  add_foreign_key 'deploy_plans', 'env_versions'
  add_foreign_key 'entity_logs', 'deploy_logs'
  add_foreign_key 'env_versions', 'environments'
  add_foreign_key 'inclusions', 'ru_versions'
  add_foreign_key 'interface_mappings', 'interfaces'
  add_foreign_key 'packages', 'file_objects'
  add_foreign_key 'ru_instances', 'env_versions'
  add_foreign_key 'ru_instances', 'ru_versions'
  add_foreign_key 'ru_versions', 'release_units'
  add_foreign_key 'scripts', 'file_objects'
  add_foreign_key 'templates', 'file_objects'
end

class DbInstance < ApplicationRecord
  belongs_to :db_version
  belongs_to :env_version
	belongs_to :ru_instance, optional: true
	has_many :deploy_plan_items, as: :entity_instance
	#has_many :before_mappings, class_name: 'DeployPlanItem', as: :after_item # entities waiting for this - why is this interesting?!?
	#has_many :before_app_instances, through: :before_mappings, source_type: 'AppInstance' # Apps waiting for this - why is this interesting?!?
	#has_many :before_db_instances, through: :before_mappings, source_type: 'DbInstance' # Dbs waiting for this - why is this interesting?!?
	has_many :after_app_instances, through: :deploy_plan_items, source_type: 'AppInstance', foreign_key: 'after_item_id'
	has_many :after_db_instances, through: :deploy_plan_items, source_type: 'DbInstance', foreign_key: 'after_item_id'
	has_many :properties, as: :owner, dependent: :destroy
	has_many :entity_logs, as: entity_instance, dependent: :destroy
	has_many :deploy_logs, through: :entity_instances
	
end

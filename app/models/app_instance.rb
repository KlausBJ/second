class AppInstance < ApplicationRecord
  belongs_to :app_version
  belongs_to :env_version
	belongs_to :ru_instance, optional: true
	has_many :deploy_plan_items, as: :entity_instance
	has_many :before_mappings, class_name: 'DeployPlanItem' # entities waiting for this
	has_many :before_app_instances, through: :before_mappings, source_type: 'AppInstance' # Apps waiting for this
	has_many :before_db_instances, through: :before_mappings, source_type: 'DbInstance' # Dbs waiting for this
	has_many :properties, as: :owner, dependent: :destroy
	
end

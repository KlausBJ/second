class AppInstance < ApplicationRecord
  belongs_to :app_version
  belongs_to :env_version
  belongs_to :ru_instance, optional: true
  has_many :deploy_plan_items, as: :entity_instance
  #has_many :before_mappings, class_name: 'DeployPlanItem', as: :after_item # entities waiting for this - why is this interesting?!?
  #has_many :before_app_instances, through: :before_mappings, source_type: 'AppInstance' # Apps waiting for this - why is this interesting?!?
  #has_many :before_db_instances, through: :before_mappings, source_type: 'DbInstance' # Dbs waiting for this - why is this interesting?!?
  has_many :after_app_instances, through: :deploy_plan_items, source: :after_item, source_type: 'AppInstance'
  has_many :after_db_instances, through: :deploy_plan_items, source: :after_item, source_type: 'DbInstance'
  has_many :properties, as: :owner, dependent: :destroy
  has_many :entity_logs, as: :entity_instance, dependent: :destroy
  has_many :deploy_logs, through: :entity_instances
  
  amoeba do
    include_association :deploy_plan_items
    include_association :properties
    include_association :entity_logs
  end
  
  def deploy_ready?
    return (after_app_instances.none? || after_app_instances.inject{ |result, ai| result = result && ai.deploy_logs.last.deployed }) && (after_db_instances.none? || after_db_instances.inject{ |result, ai| result = result && ai.deploy_logs.last.deployed })
  end
  
end

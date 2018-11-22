# Instances of AppVersions
class AppInstance < ApplicationRecord
  include DependencyHandler

  belongs_to :app_version, inverse_of: :app_instances
  belongs_to :env_version, inverse_of: :app_instances
  belongs_to :ru_instance, optional: true, inverse_of: :app_instances
  has_many :deploy_plan_items, as: :entity_instance, inverse_of: :entity_instance
  has_many :after_apps, through: :deploy_plan_items,
                        source: :after_item,
                        source_type: 'AppInstance'
  has_many :after_dbs, through: :deploy_plan_items,
                       source: :after_item,
                       source_type: 'DbInstance'
  has_many :awaiting_items, class_name: 'DeployPlanItem', as: :after_item, inverse_of: :after_item
  has_many :awaiting_apps, through: :awaiting_items, source: :entity_instance, source_type: 'AppInstance'
  has_many :awaiting_dbs, through: :awaiting_items, source: :entity_instance, source_type: 'DbInstance'
  has_many :properties, as: :owner, dependent: :destroy, inverse_of: :owner
  has_many :entity_logs, as: :entity_instance, dependent: :destroy, inverse_of: :entity_instance
  has_many :deploy_logs, through: :entity_logs

  alias_attribute :version, :app_version

  amoeba do
    include_association :deploy_plan_items
    include_association :properties
    include_association :entity_logs # # For new EnvVersion, yes - for cloned Environment, no
  end

  def deploy_ready?
    (after_apps.none? ||
      after_apps.inject { |res, aa| res && aa.deploy_logs.last.deployed }) &&
      (after_dbs.none? ||
      after_dbs.inject { |res, ad| res && ad.deploy_logs.last.deployed })
  end
end

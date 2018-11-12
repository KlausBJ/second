# Instances of DbVersions
class DbInstance < ApplicationRecord
  belongs_to :db_version
  belongs_to :env_version
  belongs_to :ru_instance, optional: true
  has_many :deploy_plan_items, as: :entity_instance
  has_many :after_apps,  through: :deploy_plan_items,
                         source: :after_item,
                         source_type: 'AppInstance'
  has_many :after_dbs, through: :deploy_plan_items,
                       source: :after_item,
                       source_type: 'DbInstance'
  has_many :properties, as: :owner, dependent: :destroy
  has_many :entity_logs, as: :entity_instance, dependent: :destroy
  has_many :deploy_logs, through: :entity_logs

  amoeba do
    include_association :deploy_plan_items
    include_association :properties
    include_association :entity_logs # For new EnvVersion, yes - for cloned Environment, no
  end

  def deploy_ready?
    (after_apps.none? ||
      after_apps.inject { |res, aa| res && aa.deploy_logs.last.deployed }) &&
      (after_dbs.none? ||
      after_dbs.inject { |res, ad| res && ad.deploy_logs.last.deployed })
  end
end

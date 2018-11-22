# Versions for Environment
class EnvVersion < ApplicationRecord
  belongs_to :environment, inverse_of: :env_versions
  has_many :properties, as: :owner, dependent: :destroy, inverse_of: :owner
  has_many :app_instances, dependent: :destroy, inverse_of: :env_version
  has_many :db_instances, dependent: :destroy, inverse_of: :env_version
  has_many :deploy_plans, dependent: :destroy, inverse_of: :env_version
  has_many :ru_instances, dependent: :destroy, inverse_of: :env_version
  has_many :deploy_logs, inverse_of: :env_version

  amoeba do
    include_association :properties # dead end
    include_association :app_instances
    include_association :db_instances
    include_association :deploy_plans # hmm, maybe...
    include_association :ru_instances
  end

  # new_ver?
  def next
    new_ver = amoeba_dup
    new_ver.version.succ!
    new_ver.save
    new_ver
  end

  def clone(name)
    new_ver = amoeba_dup
    new_ver.environment = Environment.new name: name
    new_ver.save
    new_ver.reload
  end

  def name
    environment.name
  end
end

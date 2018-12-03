# Log collection belonging to an EnvVersion
class DeployLog < ApplicationRecord
  # deployed

  belongs_to :env_version
  has_many :logs, inverse_of: :deploy_log
  end

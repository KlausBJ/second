# Log collection belonging to an EnvVersion
class DeployLog < ApplicationRecord
  belongs_to :env_version
end

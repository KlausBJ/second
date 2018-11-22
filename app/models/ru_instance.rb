# instances of RuVersion
class RuInstance < ApplicationRecord
  belongs_to :ru_version, optional: true, inverse_of: :ru_instances
  belongs_to :env_version, inverse_of: :ru_instances
  has_many :app_instances, dependent: :destroy, inverse_of: :ru_instance
  has_many :db_instances, dependent: :destroy, inverse_of: :ru_instance

  # intentionally no amoeba block here
end

# Environment - versioned - holds Instances
class Environment < ApplicationRecord
  has_many :env_versions, class_name: 'EnvVersion', dependent: :destroy, inverse_of: :environment

  alias_attribute :versions, :env_versions

	validates :name, presence: true, uniqueness: true
end

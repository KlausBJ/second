# Environment - versioned - holds Instances
class Environment < ApplicationRecord
  has_many :env_versions, dependent: :destroy, inverse_of: :environment

  alias_attribute :versions, :env_versions

	validates :name, presence: true, uniqueness: true
end

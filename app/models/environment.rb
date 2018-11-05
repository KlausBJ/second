# Environment - versioned - holds AppInstances and DbInstances
class Environment < ApplicationRecord
  has_many :env_versions, dependent: :destroy

	validates :name, presence: true, uniqueness: true
end

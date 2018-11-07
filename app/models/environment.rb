# Environment - versioned - holds AppInstances and DbInstances
class Environment < ApplicationRecord
  has_many :env_versions, dependent: :destroy

  alias_attribute :versions, :env_versions

	validates :name, presence: true, uniqueness: true

  after_create :init_env_versions

  # test created and passed
  def init_env_versions
    return if EnvVersion.where(environment_id: id).any?

    EnvVersion.create version: '1.0', environment_id: id
  end

end

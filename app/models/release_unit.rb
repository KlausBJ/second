# ReleaseUnit - versioned - optional container for Versions
class ReleaseUnit < ApplicationRecord
  # name

  has_many :ru_versions, dependent: :destroy, inverse_of: :release_unit

  alias_attribute :versions, :ru_versions

  # intentionally no amoeba block here
end

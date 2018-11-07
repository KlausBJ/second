# ReleaseUnit - versioned - optional container for AppVersions and/or DbVersions
class ReleaseUnit < ApplicationRecord
  has_many :ru_versions, dependent: :destroy

  alias_attribute :versions, :ru_versions

  after_create :init_ru_versions

  # intentionally no amoeba block here

  def init_ru_versions
    return if RuVersion.where(release_unit_id: id).any?

    RuVersion.create version: '1.0', release_unit_id: id
  end
end

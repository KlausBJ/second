# versions of ReleaseUnit
class RuVersion < ApplicationRecord
  # No need to "deep" deep copy this... Copy inclusions, not their targets
  belongs_to :release_unit
  has_many :inclusions, dependent: :destroy
  has_many :app_versions, through: :inclusions,
                          source: :entity,
                          source_type: 'AppVersion'
  has_many :db_versions, through: :inclusions,
                         source: :entity,
                         source_type: 'DbVersion'
  has_many :ru_instances
  # can remain after a deletion... perhaps name (and version?) should be copied
  # to a local property (DisplayName?), if ru_version is deleted?
  # + ru_version_id should be unset!

  def entities
    (app_versions.map { |av| "#{av.app.name} - #{av.version} (App)" } +
      db_versions.map { |dv| "#{dv.db.name} - #{dv.version} (Db)" }).sort
  end

  # new_ver?
  def next
    RuVersion.create release_unit_id: release_unit_id,
                     version: version.succ
  end
end

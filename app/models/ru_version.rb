# versions of ReleaseUnit
class RuVersion < ApplicationRecord
  # No need to "deep" deep copy this... Copy inclusions, not their targets
  belongs_to :release_unit, inverse_of: :ru_versions
  has_many :inclusions, dependent: :destroy, inverse_of: :ru_version
  has_many :versions, through: :inclusions,
                          source: :entity,
                          source_type: 'Version'
  has_many :ru_instances, inverse_of: :ru_version

  # can remain after a deletion... perhaps name (and version?) should be copied
  # to a local property (DisplayName?), if ru_version is deleted?
  # + ru_version_id should be unset!

  # new_ver?
  def next
    RuVersion.create release_unit_id: release_unit_id,
                     name: name.succ
  end
end

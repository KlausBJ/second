class RuVersion < ApplicationRecord
	# No need to "deep" deep copy this... Copy inclusions, not their targets
  belongs_to :release_unit
	has_many :inclusions, dependent: :destroy
	has_many :app_versions, through: :inclusions, source: :entity, source_type: 'AppVersion'
	has_many :db_versions, through: :inclusions, source: :entity, source_type: 'DbVersion'
	has_many :ru_instances # kan godt bestå efter en sletning... Måske skal der ske kopiering af navn + version til en lokal property (DisplayName?), hvis ru_version slettes?
	
	def entities
		return (app_versions.map{|av| "#{av.app.name} - #{av.version} (App)"} + db_versions.map{|dv| "#{dv.db.name} - #{dv.version} (Db)"}).sort
	end
	
	def next #new_ver?
		return RuVersion.create(release_unit_id: self.release_unit_id, version: self.version.succ)
	end
end

class ReleaseUnit < ApplicationRecord
	has_many :ru_versions, dependent: :destroy

	after_create :init_ru_versions
		
	def init_ru_versions
		if (RuVersion.where(release_unit_id: self.id).empty?)
			RuVersion.create(version: '1.0', release_unit_id: self.id)
		end
	end

end

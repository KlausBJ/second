class App < ApplicationRecord
	has_many :app_versions, dependent: :destroy
	has_many :interfaces, as: :entity, dependent: :destroy
	has_many :dependee_masks, as: :dependee_entity, dependent: :destroy

	after_create :init_app_versions

	def init_app_versions
		if (AppVersion.where(app_id: self.id).empty?)
			AppVersion.create(version: '1.0', app_id: self.id)
		end
	end
end

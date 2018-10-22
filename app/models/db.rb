class Db < ApplicationRecord
	has_many :db_versions, dependent: :destroy
	has_many :interfaces, as: :entity, dependent: :destroy
	has_many :dependee_masks, as: :dependee_entity, dependent: :destroy
	
	after_create :init_db_versions
		
	def init_db_versions # test created and passed
		if (DbVersion.where(db_id: self.id).empty?)
			DbVersion.create(version: '1.0', db_id: self.id)
		end
	end
end

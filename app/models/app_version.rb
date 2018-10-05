class AppVersion < ApplicationRecord
  belongs_to :app
	has_many :inclusions, as: :entity_version, dependent: :destroy
	has_many :interface_mappings, as: :entity_version, dependent: :destroy
	has_many :interfaces,  through: :interface_mappings
	has_many :packages, as: :entity_version
	has_many :scripts, as: :entity_version
	has_many :templates, as: :entity_version
	has_many :properties, as: :owner, dependent: :destroy
	has_many :dependencies, as: :depender, dependent: :destroy
	has_many :app_instances, dependent: :destroy
	
	def next #new_ver?
		return AppVersion.create(app_id: self.app_id, version: self.version.succ)
	end
	
	def parent
		return self.app
	end
end

class DbVersion < ApplicationRecord
  belongs_to :db
	has_many :inclusions, as: :entity_version, dependent: :destroy
	has_many :interface_mappings, as: :entity_version, dependent: :destroy
	has_many :interfaces, through: :interface_mappings
	has_many :packages, as: :entity_version, dependent: :destroy
	has_many :scripts, as: :entity_version, dependent: :destroy
	has_many :templates, as: :entity_version, dependent: :destroy
	has_many :properties, as: :owner, dependent: :destroy
	has_many :dependencies, as: :depender, dependent: :destroy
	has_many :db_instances, dependent: :destroy
	
	def next #new_ver?
		return DbVersion.create(app_id: self.db_id, version: self.version.succ)
	end
	
	def parent
		return self.db
	end
end

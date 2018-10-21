class RuInstance < ApplicationRecord
  belongs_to :ru_version, optional: true
  belongs_to :env_version
	has_many :app_instances, dependent: :destroy
	has_many :db_instances, dependent: :destroy

	# intentionally no amoeba block here
	
end

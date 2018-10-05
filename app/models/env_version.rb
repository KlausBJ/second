class EnvVersion < ApplicationRecord
  belongs_to :environment
	has_many :properties, as: :owner, dependent: :destroy
	has_many :app_instances, dependent: :destroy
	has_many :db_instances, dependent: :destroy
	has_many :deploy_plans, dependent: :destroy
	has_many :ru_instances, dependent: :destroy
	
end

class EnvVersion < ApplicationRecord
  belongs_to :environment
	has_many :properties, as: :owner, dependent: :destroy
	has_many :app_instances, dependent: :destroy
	has_many :db_instances, dependent: :destroy
	has_many :deploy_plans, dependent: :destroy
	has_many :ru_instances, dependent: :destroy
	
	amoeba do
		customize(lambda { |original_ver,new_ver|
			new_ver.version = original_ver.version.succ
		})
		
		include_association :properties # dead end
		include_association :app_instances
		include_association :db_instances
		include_association :deploy_plans # hmm, maybe... 
		include_association :ru_instances
	end
	
	def next #new_ver?
		return EnvVersion.create(environment_id: self.environment_id, version: self.version.succ)
	end

end

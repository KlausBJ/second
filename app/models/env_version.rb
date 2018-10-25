# Versions for Environment
class EnvVersion < ApplicationRecord
  belongs_to :environment
  has_many :properties, as: :owner, dependent: :destroy
  has_many :app_instances, dependent: :destroy
  has_many :db_instances, dependent: :destroy
  has_many :deploy_plans, dependent: :destroy
  has_many :ru_instances, dependent: :destroy

  amoeba do
    customize(lambda { |original_ver, new_ver|
      new_ver.version = original_ver.version.succ
    })

    include_association :properties # dead end
    include_association :app_instances
    include_association :db_instances
    include_association :deploy_plans # hmm, maybe...
    include_association :ru_instances
  end

  # new_ver?
  def next
    EnvVersion.create environment_id: environment_id,
                      version: version.succ
  end
end

# Plan for deployment of EnvVersion
class DeployPlan < ApplicationRecord
  belongs_to :env_version
  has_many :deploy_plan_items, dependent: :destroy
end

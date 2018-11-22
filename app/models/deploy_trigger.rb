# DeployTrigger describes whether to pull dependee along, follow dependee, or both
class DeployTrigger < ApplicationRecord
  has_many :dependencies, inverse_of: :deploy_trigger
end

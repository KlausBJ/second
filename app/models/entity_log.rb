# Log from a deployment(attempt) of AppInstance or DbInstance
class EntityLog < ApplicationRecord
  belongs_to :deploy_log
  belongs_to :entity_instance, polymorphic: true
end

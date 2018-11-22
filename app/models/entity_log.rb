# Log from a deployment(attempt) of AppInstance or DbInstance
class EntityLog < ApplicationRecord
  belongs_to :deploy_log, inverse_of: :entity_logs
  belongs_to :entity_instance, polymorphic: true, inverse_of: :entity_logs
end

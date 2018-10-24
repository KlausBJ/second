class DeployPlanItem < ApplicationRecord
  belongs_to :deploy_plan
  belongs_to :entity_instance, polymorphic: true # app_instance, db_instance
  belongs_to :after_item, polymorphic: true, optional: true # app_instance, db_instance
  
end

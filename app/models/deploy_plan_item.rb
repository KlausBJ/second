# Items belonging to a DeployPlan
class DeployPlanItem < ApplicationRecord
  belongs_to :deploy_plan, inverse_of: :deploy_plan_items
  belongs_to :entity_instance, polymorphic: true, inverse_of: :deploy_plan_items # app_instance, db_instance
  belongs_to :after_item, polymorphic: true, optional: true, inverse_of: :awaiting_items
  # app_instance, db_instance
end

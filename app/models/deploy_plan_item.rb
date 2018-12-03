# Items belonging to a DeployPlan
class DeployPlanItem < ApplicationRecord
  # order

  belongs_to :deploy_plan, inverse_of: :deploy_plan_items
  belongs_to :instance, inverse_of: :deploy_plan_items
  belongs_to :after_item, polymorphic: true, optional: true, inverse_of: :awaiting_items
  # instance, dinstance
end

class AddEntityInstanceToDeployPlanItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :deploy_plan_items, :entity_instance, polymorphic: true
  end
end

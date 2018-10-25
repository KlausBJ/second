# migration
class RemoveDeployItemFromDeployPlanItem < ActiveRecord::Migration[5.1]
  def change
    # performed manually: index dropped, columns
    # 'deploy_item_type' og 'deploy_item_id' removed
  end
end

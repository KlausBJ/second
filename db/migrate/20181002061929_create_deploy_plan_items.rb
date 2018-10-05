class CreateDeployPlanItems < ActiveRecord::Migration[5.1]
  def change
    create_table :deploy_plan_items do |t|
      t.references :deploy_plan, foreign_key: true
      t.references :deploy_item, polymorphic: true
      t.integer :order
      t.references :after_item, polymorphic: true

      t.timestamps
    end
  end
end

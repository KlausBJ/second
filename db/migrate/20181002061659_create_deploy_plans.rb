# migration
class CreateDeployPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :deploy_plans do |t|
      t.references :env_version, foreign_key: true

      t.timestamps
    end
  end
end

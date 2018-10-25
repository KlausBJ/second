# migration
class CreateDeployTriggers < ActiveRecord::Migration[5.1]
  def change
    create_table :deploy_triggers do |t|
      t.string :name
      t.integer :mask
      t.string :comment

      t.timestamps
    end
  end
end

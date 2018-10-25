# migration
class CreateDeployLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :deploy_logs do |t|
      t.references :env_version, foreign_key: true
      t.text :content
      t.boolean :deployed

      t.timestamps
    end
  end
end

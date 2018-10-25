# migration
class CreateAppInstances < ActiveRecord::Migration[5.1]
  def change
    create_table :app_instances do |t|
      t.references :app_version, foreign_key: true
      t.references :env_version, foreign_key: true

      t.timestamps
    end
  end
end

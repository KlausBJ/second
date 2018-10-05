class CreateDbInstances < ActiveRecord::Migration[5.1]
  def change
    create_table :db_instances do |t|
      t.references :db_version, foreign_key: true
      t.references :env_version, foreign_key: true

      t.timestamps
    end
  end
end

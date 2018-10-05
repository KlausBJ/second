class CreateRuInstances < ActiveRecord::Migration[5.1]
  def change
    create_table :ru_instances do |t|
      t.references :ru_version, foreign_key: true
      t.references :env_version, foreign_key: true

      t.timestamps
    end
  end
end

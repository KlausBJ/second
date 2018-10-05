class CreateEnvVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :env_versions do |t|
      t.string :version
      t.string :account
      t.string :description
      t.references :environment, foreign_key: true

      t.timestamps
    end
  end
end

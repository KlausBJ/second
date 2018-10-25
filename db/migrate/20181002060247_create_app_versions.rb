# migration
class CreateAppVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :app_versions do |t|
      t.string :version
      t.references :app, foreign_key: true

      t.timestamps
    end
  end
end

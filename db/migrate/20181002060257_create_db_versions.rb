# migration
class CreateDbVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :db_versions do |t|
      t.string :version
      t.references :db, foreign_key: true

      t.timestamps
    end
  end
end

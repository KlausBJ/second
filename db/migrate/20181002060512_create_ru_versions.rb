# migration
class CreateRuVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :ru_versions do |t|
      t.string :version
      t.references :release_unit, foreign_key: true

      t.timestamps
    end
  end
end

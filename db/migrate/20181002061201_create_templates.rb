class CreateTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :templates do |t|
      t.references :file_object, foreign_key: true
      t.string :path
      t.references :entity_version, polymorphic: true

      t.timestamps
    end
  end
end

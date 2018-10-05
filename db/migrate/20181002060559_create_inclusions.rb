class CreateInclusions < ActiveRecord::Migration[5.1]
  def change
    create_table :inclusions do |t|
      t.references :ru_version, foreign_key: true
      t.references :inclusion_entity, polymorphic: true

      t.timestamps
    end
  end
end

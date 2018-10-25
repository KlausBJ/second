# migration
class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|
      t.integer :order
      t.references :file_object, foreign_key: true
      t.references :entity_version, polymorphic: true

      t.timestamps
    end
  end
end

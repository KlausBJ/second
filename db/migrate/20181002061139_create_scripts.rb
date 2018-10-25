# migration
class CreateScripts < ActiveRecord::Migration[5.1]
  def change
    create_table :scripts do |t|
      t.integer :order
      t.string :category
      t.references :file_object, foreign_key: true
      t.references :entity_version, polymorphic: true

      t.timestamps
    end
  end
end

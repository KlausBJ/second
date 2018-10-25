# migration
class CreateInterfaceMappings < ActiveRecord::Migration[5.1]
  def change
    create_table :interface_mappings do |t|
      t.references :interface, foreign_key: true
      t.references :entity_version, polymorphic: true, index: { name:
        'interface_mapping_entity_version__type_and_id' }

      t.timestamps
    end
  end
end

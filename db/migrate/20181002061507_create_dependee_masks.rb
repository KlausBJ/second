class CreateDependeeMasks < ActiveRecord::Migration[5.1]
  def change
    create_table :dependee_masks do |t|
      t.references :dependee, foreign_key: true
      t.references :interface, foreign_key: true
      t.boolean :interface_not
      t.string :version_regex
      t.references :dependee_entity, polymorphic: true, index: { name: 'dependee_mask_dependee_entity__type_and_id' }

      t.timestamps
    end
  end
end

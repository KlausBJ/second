class RenameInterfaceToVariant < ActiveRecord::Migration[5.1]
  def change
    rename_table :interfaces, :variants
    rename_table :interface_mappings, :variant_mappings
    rename_column :variant_mappings, :interface_id, :variant_id
    rename_column :dependee_masks, :interface_not, :variant_not
    rename_column :dependee_masks, :interface_id, :variant_id
  end
end

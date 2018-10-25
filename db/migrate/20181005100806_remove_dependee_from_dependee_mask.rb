# migration
class RemoveDependeeFromDependeeMask < ActiveRecord::Migration[5.1]
  def change
    remove_reference :dependee_masks, :dependee, foreign_key: true
  end
end

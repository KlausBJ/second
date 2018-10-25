# migration
class AddDependencyToDependeeMask < ActiveRecord::Migration[5.1]
  def change
    add_reference :dependee_masks, :dependency, foreign_key: true
  end
end

# migration
class AddEntityVersionToInclusion < ActiveRecord::Migration[5.1]
  def change
    add_reference :inclusions, :entity_version, polymorphic: true
  end
end

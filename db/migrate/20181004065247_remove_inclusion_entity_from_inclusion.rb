# migration
class RemoveInclusionEntityFromInclusion < ActiveRecord::Migration[5.1]
  def change
    # performed manually: index dropped, columns 'inclusion_entity_type' and
    # 'inclusion_entity_id' removed
  end
end

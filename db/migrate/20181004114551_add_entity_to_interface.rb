class AddEntityToInterface < ActiveRecord::Migration[5.1]
  def change
    add_reference :interfaces, :entity, polymorphic: true
  end
end

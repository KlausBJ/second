# migration
class RemoveInterfaceTargetFromInterface < ActiveRecord::Migration[5.1]
  def change
    remove_reference :interfaces, :interface_target, polymorphic: true
  end
end

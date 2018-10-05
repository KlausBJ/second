class AddRuInstanceToAppInstance < ActiveRecord::Migration[5.1]
  def change
    add_reference :app_instances, :ru_instance, foreign_key: true
  end
end

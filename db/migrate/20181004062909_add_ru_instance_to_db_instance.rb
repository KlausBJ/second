class AddRuInstanceToDbInstance < ActiveRecord::Migration[5.1]
  def change
    add_reference :db_instances, :ru_instance, foreign_key: true
  end
end

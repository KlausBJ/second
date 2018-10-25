# migration
class CreateEntityLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :entity_logs do |t|
      t.references :deploy_log, foreign_key: true
      t.references :entity_instance, polymorphic: true

      t.timestamps
    end
  end
end

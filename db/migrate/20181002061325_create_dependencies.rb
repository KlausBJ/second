# migration
class CreateDependencies < ActiveRecord::Migration[5.1]
  def change
    create_table :dependencies do |t|
      t.string :name
      t.string :comment
      t.references :depender, polymorphic: true
      t.references :deploy_sequence, foreign_key: true
      t.references :deploy_trigger, foreign_key: true

      t.timestamps
    end
  end
end

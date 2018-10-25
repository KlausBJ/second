# migration
class CreateEnvironments < ActiveRecord::Migration[5.1]
  def change
    create_table :environments do |t|
      t.string :name
      t.integer :deployed_version

      t.timestamps
    end
  end
end

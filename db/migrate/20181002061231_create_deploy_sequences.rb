class CreateDeploySequences < ActiveRecord::Migration[5.1]
  def change
    create_table :deploy_sequences do |t|
      t.string :name
      t.boolean :after
      t.string :comment

      t.timestamps
    end
  end
end

class CreateDependees < ActiveRecord::Migration[5.1]
  def change
    create_table :dependees do |t|
      t.references :dependency, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end

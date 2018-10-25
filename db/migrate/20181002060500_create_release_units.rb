# migration
class CreateReleaseUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :release_units do |t|
      t.string :name

      t.timestamps
    end
  end
end

# migration
class CreateDbs < ActiveRecord::Migration[5.1]
  def change
    create_table :dbs do |t|
      t.string :name

      t.timestamps
    end
  end
end

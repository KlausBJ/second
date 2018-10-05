class CreateFileObjects < ActiveRecord::Migration[5.1]
  def change
    create_table :file_objects do |t|
      t.string :path
      t.string :filename
      t.integer :size
      t.datetime :file_created
      t.datetime :file_updated

      t.timestamps
    end
  end
end

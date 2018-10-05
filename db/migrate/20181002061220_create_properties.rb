class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :content
      t.boolean :overridable
      t.references :owner, polymorphic: true

      t.timestamps
    end
  end
end

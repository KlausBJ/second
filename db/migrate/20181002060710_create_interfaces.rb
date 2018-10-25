# migration
class CreateInterfaces < ActiveRecord::Migration[5.1]
  def change
    create_table :interfaces do |t|
      t.string :name
      t.references :interface_target, polymorphic: true

      t.timestamps
    end
  end
end

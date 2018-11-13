class AddContentToEntityLog < ActiveRecord::Migration[5.1]
  def change
    add_column :entity_logs, :content, :text
  end
end

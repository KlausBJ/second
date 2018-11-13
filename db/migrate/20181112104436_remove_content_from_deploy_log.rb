class RemoveContentFromDeployLog < ActiveRecord::Migration[5.1]
  def change
    remove_column :deploy_logs, :content, :text
  end
end

class AddColumnsToLogs < ActiveRecord::Migration[6.1]
  def change
    add_column :logs, :action, :string
    add_column :logs, :description, :string
    add_column :logs, :url, :string
  end
end

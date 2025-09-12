class RenameTaskIdToCategoryIdinTask < ActiveRecord::Migration[8.0]
  def change
    rename_column :tasks, :task_id, :category_id
  end
end

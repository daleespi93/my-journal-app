class ChangeTaskIdIntegertoReference < ActiveRecord::Migration[8.0]
  def change
    remove_column :tasks, :category_id, :integer
    add_reference :tasks, :category, null: false, foreign_key: true
  end
end

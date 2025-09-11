class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.integer :task_id, null: false
      t.string :title, null: false
      t.timestamps
    end
  end
end

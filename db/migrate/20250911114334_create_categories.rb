class CreateCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.timestamps
    end
  end
end

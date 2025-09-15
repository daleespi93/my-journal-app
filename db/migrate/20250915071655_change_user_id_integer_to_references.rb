class ChangeUserIdIntegerToReferences < ActiveRecord::Migration[8.0]
  def change
    remove_column :categories, :user_id, :integer
    add_reference :categories, :user, null: false, foreign_key: true
  end
end

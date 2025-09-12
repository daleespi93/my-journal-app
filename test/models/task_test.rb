require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "task is invalid when title is invalid" do
    task = Task.new(title: "", category_id: 1)
    assert !task.valid?, "Task has no title"
  end
  test "task is invalid when task_id is invalid" do
    task = Task.new(title: "test", category_id: nil)
    assert !task.valid?, "Task has no id"
  end
  test "task belongs to category" do
    category = Category.create!(title: "Cat test", user_id: 1)
    task = Task.new(title: "test", category_id: 1, category: category)
    assert task.valid?, "Task should belong to a category"
    assert_equal category, task.category
  end
end

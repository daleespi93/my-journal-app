require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    post session_path, params: { email_address: @user.email_address, password: "password" }

    @category = Category.create!(title: "Example", user: @user)
    @task = @category.tasks.create!(title: "My first task")
  end

  # test "should get index" do
  #   get category_tasks_path(@category)
  #   assert_response :success
  # end

  # test "should show task" do
  #   get category_task_path(@category, @task)
  #   assert_response :success
  # end

  test "should get new" do
    get new_category_task_path(@category)
    assert_response :success
  end

  test "should create task" do
    assert_difference("Task.count", 1) do
      post category_tasks_path(@category), params: { task: { title: "New Task" } }
    end
    assert_redirected_to category_path(@category)
  end

  test "should get edit" do
    get edit_category_task_path(@category, @task)
    assert_response :success
  end

  test "should update task" do
    patch category_task_path(@category, @task), params: { task: { title: "Updated Task" } }
    assert_redirected_to category_path(@category)
    @task.reload
    assert_equal "Updated Task", @task.title
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete category_task_path(@category, @task)
    end
    assert_redirected_to category_path(@category)
  end
end

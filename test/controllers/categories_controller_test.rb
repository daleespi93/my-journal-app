require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    post session_path, params: { email_address: @user.email_address, password: "password" }
    @category = Category.create!(title: "Example", user: @user)
  end
  test "should get index" do # GET
    get categories_path
    assert_response :success
  end

  test "will show category" do # GET
    get category_path(@category)
    assert_response :success
  end

  test "will make a new category" do # GET
    get new_category_path
    assert_response :success
  end

  test "will create the new category" do # POST
    assert_difference("Category.count", 1) do
      post categories_path, params: { category: { title: "test" } }
    end
    assert_redirected_to categories_path
  end

  test "will edit the category" do # GET
    get edit_category_path(@category)
    assert_response :success
  end

  test "will update the edited category" do # PATCH
    patch category_path(@category), params: { category: { title: "down" } }
    assert_redirected_to categories_path
  end

  test "will delete the category" do # DELETE
    assert_difference("Category.count", -1) do
      delete category_path(@category)
    end
      assert_redirected_to categories_path
  end
end

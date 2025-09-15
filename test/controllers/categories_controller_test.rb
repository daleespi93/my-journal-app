require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    post session_path, params: { email_address: @user.email_address, password: "password" }
  end
  test "should get index" do # GET
    get categories_path
    assert_response :success
  end

  test "will show category" do # GET
    get categories_path(@category)
    assert_response :success
  end

  # test "will make a new category" do # GET
  #   get new_category_path
  #   assert_response :success
  # end

  # test "will create the new category" do # POST
  # end

  # test "will edit the category" do # GET
  # end

  # test "will update the edited category" do # PATCH
  # end

  # test "will delete the category" do # DELETE
  # end
end

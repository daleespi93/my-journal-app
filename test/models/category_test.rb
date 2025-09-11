require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "category should fail when title is invalid" do
    @category = Category.new(title: "", user_id: 1)
    assert !@category.valid?, "Invalid title"
  end
  test "category should fail when user_id is invalid" do
    @category = Category.new(title: "test", user_id: nil)
    assert !@category.valid?, "No id"
  end
end

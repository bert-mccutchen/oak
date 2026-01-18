require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:languages)
    @category_params = { name: "Frameworks", position: 2 }
  end

  test "should get index" do
    get categories_url

    assert_response :success
  end

  test "should get new" do
    get new_category_url

    assert_response :success
  end

  test "should create the category" do
    assert_difference("Category.count", 1) do
      post categories_url, params: { category: @category_params }
    end

    assert_redirected_to category_url(Category.last)
    assert_flash :success, "Category created."
    assert_attributes_contain(Category.last, @category_params)
  end

  test "should redirect to index with an anchor" do
    get category_url(@category)

    assert_redirected_to categories_path
  end

  test "should get edit" do
    get edit_category_url(@category)

    assert_response :success
  end

  test "should update the category" do
    patch category_url(@category), params: { category: @category_params }

    assert_redirected_to category_url(@category)
    assert_flash :success, "Category updated."
    assert_attributes_contain(@category.reload, @category_params)
  end

  test "should destroy the category" do
    assert_difference("Category.count", -1) do
      delete category_url(@category)
    end

    assert_redirected_to categories_url
    assert_flash :warning, "Category destroyed."
  end
end

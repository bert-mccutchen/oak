require "test_helper"

class ImportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    stub_flame_api
  end

  test "should get new" do
    get new_import_url

    assert_response :success
  end

  test "should import applications" do
    assert_difference("Application.count", 2) do
      post imports_path(import: { host: "http://flame.local/" })
    end

    assert_redirected_to root_url
    assert_flash :success, "Import complete."
  end

  test "should import categories" do
    assert_difference("Category.count", 2) do
      post imports_path(import: { host: "http://flame.local/" })
    end

    assert_redirected_to root_url
    assert_flash :success, "Import complete."
  end

  test "should import bookmarks" do
    assert_difference("Bookmark.count", 5) do
      post imports_path(import: { host: "http://flame.local/" })
    end

    assert_redirected_to root_url
    assert_flash :success, "Import complete."
  end
end

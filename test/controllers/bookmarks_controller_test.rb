require "test_helper"

class BookmarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bookmark = bookmarks(:ruby)
    @bookmark_params = {
      category_id: categories(:languages).id,
      name: "C++",
      url: "https://isocpp.org",
      position: 2
    }
  end

  test "should get index" do
    get bookmarks_url

    assert_response :success
  end

  test "should get new" do
    get new_bookmark_url

    assert_response :success
  end

  test "should create the bookmark" do
    assert_difference("Bookmark.count", 1) do
      post bookmarks_url, params: { bookmark: @bookmark_params }
    end

    assert_redirected_to bookmark_url(Bookmark.last)
    assert_flash :success, "Bookmark created."
    assert_attributes_contain(Bookmark.last, @bookmark_params)
  end

  test "should redirect to index with an anchor" do
    get bookmark_url(@bookmark)

    assert_redirected_to bookmarks_path
  end

  test "should get edit" do
    get edit_bookmark_url(@bookmark)

    assert_response :success
  end

  test "should update the bookmark" do
    patch bookmark_url(@bookmark), params: { bookmark: @bookmark_params }

    assert_redirected_to bookmark_url(@bookmark)
    assert_flash :success, "Bookmark updated."
    assert_attributes_contain(@bookmark.reload, @bookmark_params)
  end

  test "should destroy the bookmark" do
    assert_difference("Bookmark.count", -1) do
      delete bookmark_url(@bookmark)
    end

    assert_redirected_to bookmarks_url
    assert_flash :warning, "Bookmark destroyed."
  end
end

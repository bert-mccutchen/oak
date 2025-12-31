require "test_helper"

class BookmarkTest < ActiveSupport::TestCase
  setup do
    @bookmark = Bookmark.new(
      category: categories(:languages),
      name: "Test",
      url: "https://test.test"
    )
  end

  test "bookmarks are generated with Turbo-safe tokens" do
    assert_match (/\A[a-zA-Z]+/), @bookmark.token
  end

  test "bookmarks identify by their token" do
    assert_equal @bookmark.to_param, @bookmark.token
    assert_equal @bookmark.to_key, [ @bookmark.token ]
  end

  test "validates successfully" do
    assert @bookmark.valid?
  end

  test "validates category presence" do
    @bookmark.category = nil

    assert_not @bookmark.valid?
  end

  test "validates token presence" do
    @bookmark.token = nil

    assert_not @bookmark.valid?
  end

  test "validates name presence" do
    @bookmark.name = nil

    assert_not @bookmark.valid?
  end

  test "validates url presence" do
    @bookmark.url = nil

    assert_not @bookmark.valid?
  end
end

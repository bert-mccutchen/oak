require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  setup do
    @category = Category.new(name: "Test")
  end

  test "categories are generated with Turbo-safe tokens" do
    assert_match (/\A[a-zA-Z]+/), @category.token
  end

  test "categories identify by their token" do
    assert_equal @category.to_param, @category.token
    assert_equal @category.to_key, [ @category.token ]
  end

  test "validates successfully" do
    assert @category.valid?
  end

  test "validates token presence" do
    @category.token = nil

    assert_not @category.valid?
  end

  test "validates name presence" do
    @category.name = nil

    assert_not @category.valid?
  end
end

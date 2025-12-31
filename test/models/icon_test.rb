require "test_helper"

class IconTest < ActiveSupport::TestCase
  setup do
    @icon = Icon.new(
      slug: "test",
      name: "Test"
    )
  end

  test "icons identify by their slug" do
    assert_equal @icon.to_param, @icon.slug
    assert_equal @icon.to_key, [ @icon.slug ]
  end

  test "validates successfully" do
    assert @icon.valid?
  end

  test "validates slug presence" do
    @icon.slug = nil

    assert_not @icon.valid?
  end

  test "validates name presence" do
    @icon.name = nil

    assert_not @icon.valid?
  end
end

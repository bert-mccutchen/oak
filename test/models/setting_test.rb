require "test_helper"

class SettingTest < ActiveSupport::TestCase
  setup do
    @setting = Setting.new(
      slug: "test",
      name: "Test",
      description: "Test",
      default: "Test",
      value_type: :string
    )
  end

  test "settings identify by their slug" do
    assert_equal @setting.to_param, @setting.slug
    assert_equal @setting.to_key, [ @setting.slug ]
  end

  test "validates successfully" do
    assert @setting.valid?
  end

  test "validates slug presence" do
    @setting.slug = nil

    assert_not @setting.valid?
  end

  test "validates name presence" do
    @setting.name = nil

    assert_not @setting.valid?
  end

  test "validates description presence" do
    @setting.description = nil

    assert_not @setting.valid?
  end

  test "validates default presence" do
    @setting.default = nil

    assert_not @setting.valid?
  end

  test "validates value_type presence" do
    @setting.value_type = nil

    assert_not @setting.valid?
  end
end

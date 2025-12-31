require "test_helper"

class ApplicationTest < ActiveSupport::TestCase
  setup do
    @application = Application.new(
      name: "Test",
      url: "https://test.test"
    )
  end

  test "applications are generated with Turbo-safe tokens" do
    assert_match (/\A[a-zA-Z]+/), @application.token
  end

  test "applications identify by their token" do
    assert_equal @application.to_param, @application.token
    assert_equal @application.to_key, [ @application.token ]
  end

  test "validates successfully" do
    assert @application.valid?
  end

  test "allow optional icon" do
    @application.icon = nil

    assert @application.valid?
  end

  test "validates token presence" do
    @application.token = nil

    assert_not @application.valid?
  end

  test "validates name presence" do
    @application.name = nil

    assert_not @application.valid?
  end

  test "validates url presence" do
    @application.url = nil

    assert_not @application.valid?
  end
end

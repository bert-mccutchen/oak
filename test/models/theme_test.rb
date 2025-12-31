require "test_helper"

class ThemeTest < ActiveSupport::TestCase
  setup do
    @theme = Theme.new(name: "Test")
  end

  test "themes are generated with Turbo-safe tokens" do
    assert_match (/\A[a-zA-Z]+/), @theme.token
  end

  test "themes identify by their token" do
    assert_equal @theme.to_param, @theme.token
    assert_equal @theme.to_key, [ @theme.token ]
  end

  test "validates successfully" do
    assert @theme.valid?
  end

  test "validates token presence" do
    @theme.token = nil

    assert_not @theme.valid?
  end

  test "validates name presence" do
    @theme.name = nil

    assert_not @theme.valid?
  end

  test "validates color_scheme presence" do
    @theme.color_scheme = nil

    assert_not @theme.valid?
  end
end

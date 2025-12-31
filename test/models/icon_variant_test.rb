require "test_helper"

class IconVariantTest < ActiveSupport::TestCase
  setup do
    @icon_variant = IconVariant.new(
      icon: icons(:unifi),
      format: :svg,
      theme: :light
    )
  end

  test "validates successfully" do
    assert @icon_variant.valid?
  end

  test "validates icon presence" do
    @icon_variant.icon = nil

    assert_not @icon_variant.valid?
  end

  test "validates format presence" do
    @icon_variant.format = nil

    assert_not @icon_variant.valid?
  end

  test "validates theme presence" do
    @icon_variant.theme = nil

    assert_not @icon_variant.valid?
  end
end

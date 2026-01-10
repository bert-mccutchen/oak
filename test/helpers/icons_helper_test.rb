require "test_helper"

class IconsHelperTest < ActionView::TestCase
  test "should render the no icon tag if an icon is not provided" do
    assert_includes icon_tag(nil), "fa-question"
  end

  test "should render themed SVG icons" do
    assert_includes icon_tag(icons(:unifi)), "fill:var(--color-primary)"
  end

  test "should link to themed PNG icons" do
    params = { theme: "forest" }.to_param

    assert_includes icon_tag(icons(:dokploy)), "dokploy.png?#{params}"
  end

  test "should link to colorized PNG icons when forced" do
    Current.icon_color = "oklch(0 0 0)"

    params = { color: Current.icon_color }.to_param

    assert_includes icon_tag(icons(:dokploy)), "dokploy.png?#{params}"
  end
end

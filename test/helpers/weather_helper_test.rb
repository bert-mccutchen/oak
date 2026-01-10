require "test_helper"

class WeatherHelperTest < ActionView::TestCase
  setup do
    stub_weather
  end

  test "should not render temperature if weather is disabled" do
    Setting.find_by(slug: :weather_enabled).update(value: false)

    assert_nil temperature_tag
  end

  test "should not render weather icon if weather is disabled" do
    Setting.find_by(slug: :weather_enabled).update(value: false)

    assert_nil weather_icon_tag
  end

  test "should render the temperature with the unit from settings" do
    assert_includes temperature_tag, "0°C"
  end

  test "should render the weather icon based on conditions and time" do
    travel_to Time.current.beginning_of_day do
      assert_includes weather_icon_tag, "fa-moon"
    end

    travel_to Time.current.middle_of_day do
      assert_includes weather_icon_tag, "fa-sun"
    end

    travel_to Time.current.end_of_day do
      assert_includes weather_icon_tag, "fa-moon"
    end

    assert_includes weather_icon_tag, "Clear Sky"
  end

  test "should render extra provided data attributes for temperature" do
    assert_includes temperature_tag(data: { foo: "bar" }), "data-foo=\"bar\""
  end

  test "should render extra provided class attributes for temperature" do
    assert_includes temperature_tag(class: "foo-bar"), "class=\"foo-bar\""
  end

  test "should render extra provided data attributes for the weather icon" do
    assert_includes weather_icon_tag(data: { foo: "bar" }), "data-foo=\"bar\""
  end

  test "should render extra provided class attributes the weather icon" do
    assert_includes weather_icon_tag(class: "foo-bar"), "class=\"foo-bar\""
  end
end

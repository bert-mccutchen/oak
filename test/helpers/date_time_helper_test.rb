require "test_helper"

class DateTimeHelperTest < ActionView::TestCase
  setup do
    # August 6th 1991 - the first website launched.
    @significant_date =
      Time.use_zone(Setting[:time_zone]) do
        Time.zone.local(1991, 8, 6, 17, 4, 2).freeze
      end
  end

  test "should not render if date is disabled" do
    Setting.find_by(slug: :date_enabled).update(value: false)

    assert_nil date_tag
  end

  test "should not render if time is disabled" do
    Setting.find_by(slug: :time_enabled).update(value: false)

    assert_nil time_tag
  end

  test "should render the date with the format from settings" do
    Time.use_zone(Setting[:time_zone]) do
      travel_to @significant_date do
        assert_includes date_tag, "Tuesday, August 06 1991"
      end
    end
  end

  test "should render the time with the format from settings" do
    Time.use_zone(Setting[:time_zone]) do
      travel_to @significant_date do
        assert_includes time_tag, "5:04:02 pm"
      end
    end
  end

  test "should render the date-time Stimulus controller values for dates" do
    assert_includes date_tag, "data-controller=\"date-time\""
    assert_includes date_tag, "data-date-time-time-zone-value=\"-05:00\""
    assert_includes date_tag, "data-date-time-format-value=\"%A, %B %d %Y\""
  end

  test "should render the date-time Stimulus controller values for times" do
    assert_includes date_tag, "data-controller=\"date-time\""
    assert_includes date_tag, "data-date-time-time-zone-value=\"-05:00\""
    assert_includes date_tag, "data-date-time-format-value=\"%A, %B %d %Y\""
  end

  test "should render extra provided data attributes for date" do
    assert_includes date_tag(data: { foo: "bar" }), "data-foo=\"bar\""
  end

  test "should render extra provided class attributes for date" do
    assert_includes date_tag(class: "foo-bar"), "class=\"foo-bar\""
  end

  test "should render extra provided data attributes for time" do
    assert_includes time_tag(data: { foo: "bar" }), "data-foo=\"bar\""
  end

  test "should render extra provided class attributes for time" do
    assert_includes time_tag(class: "foo-bar"), "class=\"foo-bar\""
  end
end

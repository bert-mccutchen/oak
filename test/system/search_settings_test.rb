require "application_system_test_case"

class SearchSettingsTest < ApplicationSystemTestCase
  include OpenMeteoHelper

  setup do
    skip("Skipping hotkey tests in CI") if ENV["CI"]

    @hotkeys = [ [ :meta, "k" ], [ :ctrl, "k" ], [ :tab ] ]

    settings(:weather_enabled).update!(value: false)

    Capybara.default_max_wait_time = 10
  end

  test "using the search hotkey shows the search" do
    @hotkeys.each do |hotkey|
      settings(:search_hotkey).update!(value: hotkey.join("+"))

      visit root_url
      assert_selector "body"

      page.send_keys hotkey

      assert_selector "#self_search #q_name_cont", visible: true
    end
  end

  test "using the search hotkey and tabbing shows the web search" do
    @hotkeys.each do |hotkey|
      settings(:search_hotkey).update!(value: hotkey.join("+"))

      visit root_url
      assert_selector "body"

      page.send_keys hotkey
      find("#q_name_cont").send_keys [ :tab ]

      assert_no_selector "#self_search #q_name_cont", visible: true
      assert_selector "#web_search #q", visible: true

      find("#web_search").send_keys [ :tab ]

      assert_selector "#self_search #q_name_cont", visible: true
      assert_no_selector "#web_search #q", visible: true
    end
  end
end

require "application_system_test_case"

class SearchSettingsTest < ApplicationSystemTestCase
  include OpenMeteoHelper

  setup do
    @hotkeys = [ [ :meta, "k" ], [ :ctrl, "k" ], [ :tab ] ]

    settings(:weather_enabled).update!(value: false)
  end

  test "using the search hotkey shows the search" do
    @hotkeys.each do |hotkey|
      settings(:search_hotkey).update!(value: hotkey.join("+"))

      visit root_url

      page.send_keys hotkey

      within find("#self_search") do
        assert find("#q_name_cont").visible?
      end
    end
  end

  test "using the search hotkey and tabbing shows the web search" do
    @hotkeys.each do |hotkey|
      settings(:search_hotkey).update!(value: hotkey.join("+"))

      visit root_url

      page.send_keys hotkey
      find("#q_name_cont").send_keys [ :tab ]

      within find("#self_search", visible: :all) do
        assert_not find("#q_name_cont", visible: :all).visible?
      end

      within find("#web_search") do
        assert find("#q").visible?
      end

      find("#web_search").send_keys [ :tab ]

      within find("#self_search") do
        assert find("#q_name_cont").visible?
      end

      within find("#web_search", visible: :all) do
        assert_not find("#q", visible: :all).visible?
      end
    end
  end
end

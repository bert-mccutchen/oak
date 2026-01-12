require "application_system_test_case"

class WebSearchTest < ApplicationSystemTestCase
  include OpenMeteoHelper

  setup do
    settings(:weather_enabled).update!(value: false)
  end

  test "does not show the search by default" do
    [ root_url, settings_url, applications_url, bookmarks_url, categories_url, themes_url ].each do |url|
      visit url

      within find("#web_search", visible: :all) do
        assert_not find("#q", visible: :all).visible?
      end
    end
  end

  test "using the search hotkey and tabbing shows the web search" do
    [ root_url, settings_url, applications_url, bookmarks_url, categories_url, themes_url ].each do |url|
      visit url

      page.send_keys [ :meta, "k" ]
      find("#q_name_cont").send_keys [ :tab ]

      within find("#self_search", visible: :all) do
        assert_not find("#q_name_cont", visible: :all).visible?
      end

      within find("#web_search") do
        assert find("#q").visible?
      end
    end
  end
end

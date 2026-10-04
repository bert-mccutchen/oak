require "application_system_test_case"

class WebSearchTest < ApplicationSystemTestCase
  include OpenMeteoHelper

  setup do
    skip("Skipping hotkey tests in CI") if ENV["CI"]

    settings(:weather_enabled).update!(value: false)

    Capybara.default_max_wait_time = 10
  end

  test "does not show the search by default" do
    [ root_url, settings_url, applications_url, bookmarks_url, categories_url, themes_url ].each do |url|
      visit url
      assert_selector "body"

      assert_no_selector "#web_search #q", visible: true
    end
  end

  test "using the search hotkey and tabbing shows the web search" do
    [ root_url, settings_url, applications_url, bookmarks_url, categories_url, themes_url ].each do |url|
      visit url
      assert_selector "body"

      page.send_keys [ :meta, "k" ]
      find("#q_name_cont").send_keys [ :tab ]

      assert_no_selector "#self_search #q_name_cont", visible: true
      assert_selector "#web_search #q", visible: true
    end
  end
end

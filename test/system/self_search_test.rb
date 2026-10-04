require "application_system_test_case"

class SelfSearchTest < ApplicationSystemTestCase
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

      assert_no_selector "#self_search #q_name_cont", visible: true
    end
  end

  test "using the search hotkey shows the search" do
    [ root_url, settings_url, applications_url, bookmarks_url, categories_url, themes_url ].each do |url|
      visit url
      assert_selector "body"

      page.send_keys [ :meta, "k" ]

      assert_selector "#self_search #q_name_cont", visible: true
    end
  end

  test "searching applications and bookmarks" do
    visit root_url

    page.send_keys [ :meta, "k" ]

    within find("#search") do
      assert_no_text "UniFi"
      assert_no_text "Unraid"
      assert_no_text "JavaScript"
      assert_no_text "Ruby"

      fill_in("q_name_cont", with: "r")

      assert_no_text "UniFi"
      assert_text "Unraid"
      assert_text "JavaScript"
      assert_text "Ruby"

      fill_in("q_name_cont", with: "unr")

      assert_no_text "UniFi"
      assert_text "Unraid"
      assert_no_text "JavaScript"
      assert_no_text "Ruby"

      fill_in("q_name_cont", with: "un")

      assert_text "UniFi"
      assert_text "Unraid"
      assert_no_text "JavaScript"
      assert_no_text "Ruby"

      fill_in("q_name_cont", with: " ")

      assert_no_text "UniFi"
      assert_no_text "Unraid"
      assert_no_text "JavaScript"
      assert_no_text "Ruby"
    end
  end
end

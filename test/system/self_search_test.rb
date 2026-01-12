require "application_system_test_case"

class SelfSearchTest < ApplicationSystemTestCase
  include OpenMeteoHelper

  setup do
    settings(:weather_enabled).update!(value: false)
  end

  test "does not show the search by default" do
    [ root_url, settings_url, applications_url, bookmarks_url, categories_url, themes_url ].each do |url|
      visit url

      within find("#self_search", visible: :all) do
        assert_not find("#q_name_cont", visible: :all).visible?
      end
    end
  end

  test "using the search hotkey shows the search" do
    [ root_url, settings_url, applications_url, bookmarks_url, categories_url, themes_url ].each do |url|
      visit url

      page.send_keys [ :meta, "k" ]

      within find("#self_search") do
        assert find("#q_name_cont").visible?
      end
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

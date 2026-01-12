require "application_system_test_case"

class HomeTest < ApplicationSystemTestCase
  include OpenMeteoHelper

  DATE_TIME_REGEX = /[A-Z]+, [A-Z]+ [0-9]{1,2} [0-9]{4} – [0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2} (AM|PM)/.freeze
  GREETING_REGEX = /Good (morning|afternoon|evening|night)./.freeze

  setup do
    Bookmark.delete_all
    Category.delete_all
    Application.delete_all

    settings(:weather_enabled).update!(value: false)
  end

  test "initial setup" do
    visit root_url

    assert_text DATE_TIME_REGEX
    assert_text GREETING_REGEX
    assert_text "Life's a box of chocolates, Forrest. You never know what you're gonna get."
    assert_text "Mrs. Gump"
    assert_text "APPLICATIONS"
    assert_text "BOOKMARKS"
    assert find_link("New Application").visible?
    assert find_link("New Category").visible?
  end

  test "applications page link" do
    visit root_url

    within(".container") do
      click_link("Applications")
    end
    assert find_link("New Application").visible?
  end

  test "bookmarks page link" do
    visit root_url

    within(".container") do
      click_link("Bookmarks")
    end
    assert find_link("New Category").visible?
  end

  test "initial application setup" do
    visit root_url

    click_link("New Application")
    assert find_button("Create Application").visible?
  end

  test "initial category setup" do
    visit root_url

    click_link("New Category")
    assert find_button("Create Category").visible?
  end

  test "settings navigation" do
    visit root_url

    click_link(id: "navigation")
    within("#navigation_dropdown") do
      click_link("Settings")
    end
    assert find_link("Manage Quotes").visible?
  end

  test "applications navigation" do
    visit root_url

    click_link(id: "navigation")
    within("#navigation_dropdown") do
      click_link("Applications")
    end
    assert find_link("New Application").visible?
  end

  test "bookmarks navigation" do
    visit root_url

    click_link(id: "navigation")
    within("#navigation_dropdown") do
      click_link("Bookmarks")
    end
    assert find_link("New Category").visible?
  end

  test "themes navigation" do
    visit root_url

    click_link(id: "navigation")
    within("#navigation_dropdown") do
      click_link("Themes")
    end
    assert_text "Standard Themes"
  end

  test "theme select navigation" do
    visit root_url

    click_link(id: "theme_select")
    within("#theme_select_dropdown") do
      click_link("Edit themes")
    end
    assert_text "Standard Themes"
  end
end

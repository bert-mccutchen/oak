require "application_system_test_case"

class IconsTest < ApplicationSystemTestCase
  setup do
    load "db/seeds/icons.rb"
  end

  test "visiting the index" do
    visit icons_url

    assert find("#q_name_cont").visible?
  end

  test "paging icons" do
    visit icons_url

    assert_text "1Password"

    find('a[aria-label="Next"]').click

    assert_no_text "1Password"

    find('a[aria-label="Previous"]').click

    assert_text "1Password"
  end

  test "searching icons" do
    visit icons_url

    assert_text "1Password"
    assert_no_text "Unraid"

    fill_in("q_name_cont", with: "unr")

    assert_text "Unraid"
    assert_no_text "1Password"

    fill_in("q_name_cont", with: " ")

    assert_text "1Password"
    assert_no_text "Unraid"
  end
end

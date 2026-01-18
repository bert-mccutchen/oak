require "test_helper"

class ThemesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @theme = themes(:forest)
    @theme_params = {
      name: "Gruvbox",
      color_scheme: "dark",
      color_base_100: "oklch(0.268 0.007 34.298)",
      color_base_200: "oklch(0.374 0.01 67.558)",
      color_base_300: "oklch(0.444 0.011 73.639)",
      color_base_content: "oklch(0.954 0.038 75.164)",
      color_primary: "oklch(0.705 0.213 47.604)",
      color_primary_content: "oklch(0.901 0.076 70.697)",
      color_secondary: "oklch(0.552 0.016 285.938)",
      color_secondary_content: "oklch(0.985 0 0)",
      color_accent: "oklch(0.827 0.119 306.383)",
      color_accent_content: "oklch(0.291 0.149 302.717)",
      color_neutral: "oklch(0.871 0.15 154.449)",
      color_neutral_content: "oklch(0.262 0.051 172.552)",
      color_info: "oklch(0.828 0.111 230.318)",
      color_info_content: "oklch(0% 0 0)",
      color_success: "oklch(0.897 0.196 126.665)",
      color_success_content: "oklch(0% 0 0)",
      color_warning: "oklch(0.879 0.169 91.605)",
      color_warning_content: "oklch(0% 0 0)",
      color_error: "oklch(0.637 0.237 25.331)",
      color_error_content: "oklch(0% 0 0)",
      radius_selector: 0.25,
      radius_field: 0.5,
      radius_box: 0.5,
      size_selector: 0.25,
      size_field: 0.25,
      border: 1.0,
      depth: false,
      noise: true,
      enabled: false
    }
  end

  test "should get index" do
    get themes_url

    assert_response :success
  end

  test "should get new" do
    get new_theme_url

    assert_response :success
  end

  test "should create the theme" do
    assert_difference("Theme.count", 1) do
      post themes_url, params: { theme: @theme_params }
    end

    assert_redirected_to theme_url(Theme.last)
    assert_flash :success, "Theme created."
    assert_attributes_contain(Theme.last, @theme_params)
  end

  test "should redirect to index with an anchor" do
    get theme_url(@theme)

    assert_redirected_to themes_path
  end

  test "should get edit" do
    get edit_theme_url(@theme)

    assert_response :success
  end

  test "should update the theme" do
    patch theme_url(@theme), params: { theme: @theme_params }

    assert_redirected_to theme_url(@theme)
    assert_flash :success, "Theme updated."
    assert_attributes_contain(@theme.reload, @theme_params)
  end

  test "should destroy the theme" do
    assert_difference("Theme.count", -1) do
      delete theme_url(@theme)
    end

    assert_redirected_to themes_url
    assert_flash :warning, "Theme destroyed."
  end
end

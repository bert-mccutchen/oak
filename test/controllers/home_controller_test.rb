require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    stub_weather
    get home_url
    assert_response :success
  end

  test "should get preview" do
    stub_weather
    get home_preview_url
    assert_response :success
  end
end

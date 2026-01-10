require "test_helper"

class ImportsControllerErrorTest < ActionDispatch::IntegrationTest
  setup do
    stub_flame_api_error
  end

  test "should report API errors to the user" do
    post imports_path(import: { host: "http://flame.local" })

    assert_response :unprocessable_content
    assert_dom "label.text-error", /Flame Error \(404\)/
  end
end

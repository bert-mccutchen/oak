require "test_helper"

class ErrorsHelperTest < ActionView::TestCase
  test "should return the Rack status code message" do
    Rack::Utils::HTTP_STATUS_CODES.each do |code, message|
      assert_equal error_message(status: code), message
    end
  end

  test "should implement RFC 2324" do
    assert_equal error_message(status: 418), "I'm a teapot"
  end
end

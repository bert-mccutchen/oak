require "test_helper"

class SettingsHelperTest < ActionView::TestCase
  test "should comma separate an array" do
    assert_equal directive_format([ "%Y", "%C", "%y" ]), "%Y, %C, %y"
  end

  test "should comma separate and evaluate an array of datetime formatter directives" do
    assert_equal directive_example([ "%Y", "%m", "%d", "%I", "%M", "%S", "%P" ]),
                 "\"1991\", \"08\", \"06\", \"05\", \"04\", \"02\", \"pm\""
  end
end

require "test_helper"

class ColorHelperTest < ActionView::TestCase
  test "should parse a OKLCH string" do
    assert_equal({ l: 0, c: 0, h: 0 }, parse_oklch("oklch(0 0 0)"))
    assert_equal({ l: 0, c: 0, h: 0 }, parse_oklch("oklch(0% 0 0)"))
    assert_equal({ l: 0.99, c: 0.99, h: 360 }, parse_oklch("oklch(0.99 0.99 360)"))
    assert_equal({ l: 0.99, c: 0.99, h: 360 }, parse_oklch("oklch(99% 0.99 360)"))
  end

  test "should not parse an invalid OKLCH string" do
    assert_raises(ArgumentError) { parse_oklch("oklch()") }
    assert_raises(ArgumentError) { parse_oklch("oklch(a b c)") }
    assert_raises(ArgumentError) { parse_oklch("oklch(1, 2, 3)") }
  end

  test "should properly convert all black hues from OKLCH to HEX" do
    (0..360).each do |hue|
      assert_equal "#000000", oklch_to_hex(l: 0, c: 0, h: hue)
    end
  end

  test "should properly convert all white hues from OKLCH to HEX" do
    (0..360).each do |hue|
      assert_equal "#ffffff", oklch_to_hex(l: 1, c: 0, h: hue)
    end
  end

  test "should properly convert OKLCH to HEX" do
    # Random page-load values from visiting https://oklch.com
    assert_equal "#9995da", oklch_to_hex(**parse_oklch("oklch(0.7 0.1 286)"))
    assert_equal "#d58678", oklch_to_hex(**parse_oklch("oklch(0.7 0.1 31)"))
    assert_equal "#a790d4", oklch_to_hex(**parse_oklch("oklch(0.7 0.1 299)"))
    assert_equal "#51b39a", oklch_to_hex(**parse_oklch("oklch(0.7 0.1 174)"))
    assert_equal "#a193d7", oklch_to_hex(**parse_oklch("oklch(0.7 0.1 293)"))

    # Randomly picked values from https://oklch.com
    assert_equal "#89234d", oklch_to_hex(**parse_oklch("oklch(0.4318 0.1416 360)"))
    assert_equal "#8ef103", oklch_to_hex(**parse_oklch("oklch(0.8635 0.2432 133)"))
    assert_equal "#5a1a00", oklch_to_hex(**parse_oklch("oklch(0.3192 0.1001 40)"))
    assert_equal "#009da9", oklch_to_hex(**parse_oklch("oklch(0.6291 0.1219 203)"))
    assert_equal "#ffbe69", oklch_to_hex(**parse_oklch("oklch(0.8442 0.1267 72)"))
  end
end

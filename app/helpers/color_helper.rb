# frozen_string_literal: true

require "rmagick"

# There's a lot of magic numbers in this file.
# I don't like it, but answers are hard to come by when looking into them.
module ColorHelper
  def oklch_to_oklab(l:, c:, h:)
    h_rad = (h * Math::PI) / 180
    a_axis = c * Math.cos(h_rad)
    b_axis = c * Math.sin(h_rad)

    { l: l, a: a_axis, b: b_axis }
  end

  def oklab_to_linear_rgb(l:, a:, b:)
    l_cube = (l + 0.3963377774 * a + 0.2158037573 * b) ** 3
    m_cube = (l - 0.1055613458 * a - 0.0638541728 * b) ** 3
    s_cube = (l - 0.0894841775 * a - 1.2914855480 * b) ** 3

    {
      r: +4.0767416621 * l_cube - 3.3077115913 * m_cube + 0.2309699292 * s_cube,
      g: -1.2684380046 * l_cube + 2.6097574011 * m_cube - 0.3413193965 * s_cube,
      b: -0.0041960863 * l_cube - 0.7034186147 * m_cube + 1.7076147010 * s_cube
    }
  end

  def linear_rgb_to_standard_rgb(r:, g:, b:)
    {
      r: gamma_correct(r),
      g: gamma_correct(g),
      b: gamma_correct(b)
    }
  end

  def standard_rgb_to_hex(r:, g:, b:)
    sprintf("#%02x%02x%02x", convert_8bit(r), convert_8bit(g), convert_8bit(b))
  end

  def oklch_to_hex(l:, c:, h:)
    oklab = oklch_to_oklab(l:, c:, h:)
    linear_rgb = oklab_to_linear_rgb(**oklab)
    standard_rgb = linear_rgb_to_standard_rgb(**linear_rgb)

    standard_rgb_to_hex(**standard_rgb)
  end

  def parse_oklch(oklch)
    matches = oklch.match(/oklch\s*\(\s*(?<l>[0-9.]+)%?\s+(?<c>[0-9.]+)\s+(?<h>[0-9.]+)(?:deg)?\s*\)/i)
    raise ArgumentError, "Invalid OKLCH color" unless matches

    l = matches[:l].to_f
    c = matches[:c].to_f
    h = matches[:h].to_f
    l = l / 100 if oklch.include?("%")

    { l:, c:, h: }
  end

  private

  def gamma_correct(val)
    return 12.92 * val if val <= 0.0031308

    1.055 * (val ** (1 / 2.4)) - 0.055
  end

  def convert_8bit(val)
    [ 0, [ 255, (val * 255).round ].min ].max
  end
end

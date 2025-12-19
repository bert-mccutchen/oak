require "rmagick"

module IconsHelper
  include ActionView::Helpers::AssetUrlHelper

  def icon_tag(icon_variant, **opts)
    path = icon_path(icon_variant.slug, format: icon_variant.format)

    if icon_variant.svg?
      inline_svg_tag(icon_variant, **opts)
    else
      image_tag("#{path}?theme=#{Current.theme.token}", **opts)
    end
  end

  protected

  def colorize_svg(icon_variant)
    Rails.cache.fetch(icon_variant, expires_in: 12.hours) do
      File.read(icon_asset_path(icon_variant))
          .gsub(/fill:(\s+)?#[0-9A-Fa-f]+/i, "fill:var(--color-primary)")
          .gsub(/stop-color:(\s+)?#[0-9A-Fa-f]+/i, "stop-color:var(--color-primary)")
    end
  end

  def colorize_png(icon_variant)
    Rails.cache.fetch([ icon_variant, icon_color ], expires_in: 12.hours) do
      image = Magick::Image.read(icon_asset_path(icon_variant)).first
      image.format = "PNG"
      image.fuzz = "10%"

      image.quantize(256, Magick::GRAYColorspace)
          .transparent("white")
          .colorize(0.9, 0.9, 0.9, icon_color)
          .to_blob
    end
  end

  private

  def icon_asset_path(icon_variant)
    image_path(Rails.root.join(icon_variant.path))
  end

  def icon_color
    oklch_to_hex(Current.theme.color_primary)
  end

  # I don't really like this, but I need a hex value for ImageMagick.
  # There's far too many unexplained magic numbers.
  # https://bottosson.github.io/posts/oklab/#oklab-implementations
  def oklch_to_hex(oklch)
    # Parse OKLCH string
    match = oklch.match(/oklch\s*\(\s*([0-9.]+)%?\s+([0-9.]+)\s+([0-9.]+)(?:deg)?\s*\)/i)
    raise ArgumentError, "Invalid OKLCH color" unless match

    l = match[1].to_f
    c = match[2].to_f
    h = match[3].to_f

    # Convert percentage to a decimal value.
    l = l / 100 if oklch.include?("%")

    # Convert OKLCH to OKLAB.
    h_rad = (h * Math::PI) / 180
    a = c * Math.cos(h_rad)
    b = c * Math.sin(h_rad)

    # Convert OKLAB to linear RGB.
    l_ = l + 0.3963377774 * a + 0.2158037573 * b
    m_ = l - 0.1055613458 * a - 0.0638541728 * b
    s_ = l - 0.0894841775 * a - 1.2914855480 * b

    l3 = l_ * l_ * l_
    m3 = m_ * m_ * m_
    s3 = s_ * s_ * s_

    r = +4.0767416621 * l3 - 3.3077115913 * m3 + 0.2309699292 * s3
    g = -1.2684380046 * l3 + 2.6097574011 * m3 - 0.3413193965 * s3
    b_rgb = -0.0041960863 * l3 - 0.7034186147 * m3 + 1.7076147010 * s3

    # Convert linear RGB to sRGB.
    r = linear_to_srgb(r)
    g = linear_to_srgb(g)
    b_rgb = linear_to_srgb(b_rgb)

    # Clamp and convert to 8-bit.
    r = [ 0, [ 255, (r * 255).round ].min ].max
    g = [ 0, [ 255, (g * 255).round ].min ].max
    b_rgb = [ 0, [ 255, (b_rgb * 255).round ].min ].max

    # Convert to HEX.
    sprintf("#%02x%02x%02x", r, g, b_rgb)
  end

  def linear_to_srgb(val)
    return 12.92 * val if val <= 0.0031308

    1.055 * (val ** (1 / 2.4)) - 0.055
  end
end

require "rmagick"

module IconsHelper
  include ActionView::Helpers::AssetUrlHelper

  def icon_tag(icon_variant, **opts)
    path = icon_path(icon_variant.slug, format: icon_variant.format)

    icon_variant.svg? ? inline_svg_tag(icon_variant, **opts) : image_tag(path, **opts)
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
    Current.theme.color_primary
  end
end

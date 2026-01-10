require "rmagick"
require_relative "color_helper"

module IconsHelper
  include ActionView::Helpers::AssetUrlHelper
  include ColorHelper

  def icon_tag(icon, **opts)
    return no_icon_tag(**opts) unless icon

    path = icon_path(
      icon.best_variant.slug,
      theme: Current.theme.token,
      color: Current.icon_color,
      format: icon.best_variant.format
    )

    if icon.best_variant.svg?
      inline_svg_tag(icon.best_variant, **opts)
    else
      image_tag(path, **opts)
    end
  end

  def no_icon_tag(**opts)
    content_tag(:div, class: token_list("flex border border-primary rounded-box", opts[:class])) do
      tag.i(**opts, class: "fa-solid fa-question m-auto text-primary")
    end
  end

  protected

  def colorize_svg(icon_variant, color = "var(--color-primary)")
    Rails.cache.fetch([ icon_variant, color ], expires_in: 12.hours) do
      File.read(icon_asset_path(icon_variant))
          .gsub(/fill:(\s+)?#[0-9A-Fa-f]+/i, "fill:#{color}")
          .gsub(/stroke:(\s+)?#[0-9A-Fa-f]+/i, "stroke:#{color}")
          .gsub(/stop-color:(\s+)?#[0-9A-Fa-f]+/i, "stop-color:#{color}")
    end
  end

  def colorize_png(icon_variant, color = nil)
    hex_color = oklch_to_hex(**parse_oklch(color || Current.theme.color_primary))

    Rails.cache.fetch([ icon_variant, hex_color ], expires_in: 12.hours) do
      image = Magick::Image.read(icon_asset_path(icon_variant)).first
      image.format = "PNG"
      image.fuzz = "10%"

      image.quantize(256, Magick::GRAYColorspace)
          .transparent("white")
          .colorize(0.9, 0.9, 0.9, hex_color)
          .to_blob
    end
  end

  private

  def icon_asset_path(icon_variant)
    image_path(Rails.root.join(icon_variant.path))
  end
end

require_relative "../../app/helpers/icons_helper"

class IconAssetFileLoader < InlineSvg::AssetFile
  extend IconsHelper

  def self.named(icon_variant_or_filename)
    return colorize_svg(icon_variant_or_filename) if icon_variant_or_filename.is_a?(IconVariant)

    super
  end
end

InlineSvg.configure do |config|
  config.svg_not_found_css_class = "size-full aspect-square py-2 border border-dashed border-error rounded-box"
  config.asset_file = IconAssetFileLoader
end

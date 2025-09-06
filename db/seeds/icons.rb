# require "ostruct"

class IconHash < Hash
  def []=(key, value)
    super(key.downcase.to_sym, format_value(value))
  end

  def valid_format?
    self[:svg] || self[:png]
  end

  def format_value(value)
    return value unless value == "Yes" || value == "No"

    value == "Yes"
  end
end

ICONS_MANIFEST_PATH = Rails.root.join("vendor/images/selfhst/icons/index.json")
ICONS_MANIFEST = JSON.load_file!(ICONS_MANIFEST_PATH, object_class: IconHash)
GROUPED_ICONS_MANIFEST = ICONS_MANIFEST.group_by { it[:reference] }

icons = ICONS_MANIFEST.filter(&:valid_format?).map do |icon|
  { slug: icon[:reference], **icon.slice(:name, :tags) }
end

Icon.upsert_all(icons, unique_by: :slug)

icon_variants = Icon.find_each.flat_map do |icon|
  variants = []

  GROUPED_ICONS_MANIFEST[icon.slug].each do |variant|
    if variant[:svg] && variant[:light]
      variants << { icon_id: icon.id, format: :svg, theme: :light }
    end

    if variant[:png]
      variants << { icon_id: icon.id, format: :png, theme: :default }
      variants << { icon_id: icon.id, format: :png, theme: :light } if variant[:light]
      variants << { icon_id: icon.id, format: :png, theme: :dark } if variant[:dark]
    end
  end

  variants
end

IconVariant.upsert_all(icon_variants, unique_by: %i[icon_id format theme])

# Delete icons that are no longer in icons array
Icon.where.not(slug: icons.map { it[:slug] }).delete_all

# Delete icon variants that are no longer in icon_variants array
IconVariant.find_each do |icon_variant|
  next if icon_variants.any? { it[:icon_id] == icon_variant.icon_id && it[:format] == icon_variant.format.to_sym && it[:theme] == icon_variant.theme.to_sym }

  icon_variant.destroy
end

# Delete icons without variants
Icon.where.missing(:icon_variants).delete_all

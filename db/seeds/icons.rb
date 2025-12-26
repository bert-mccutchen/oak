# require "ostruct"

class IconHash < Hash
  def []=(key, value)
    super(key.downcase.to_sym, format_value(value))
  end

  def slug
    self[:slug]
  end

  def record_attributes
    { slug: self[:reference], **self.slice(:name, :tags) }
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

valid_icons = ICONS_MANIFEST.filter(&:valid_format?)

# Delete all icons that have been removed or are no longer valid.
Icon.where.not(slug: valid_icons.map(&:slug)).destroy_all

# Upsert icons that are in the manifest and valid.
Icon.upsert_all(valid_icons.map(&:record_attributes), unique_by: :slug)

# Upsert all icon variants for icons that are in the database.
icon_variants = Icon.find_each.flat_map do |icon|
  variants = []

  GROUPED_ICONS_MANIFEST[icon.slug].each do |icon_hash|
    if icon_hash[:svg] && icon_hash[:light]
      variants << { icon_id: icon.id, format: :svg, theme: :light }
    end

    if icon_hash[:png]
      variants << { icon_id: icon.id, format: :png, theme: :default }
      variants << { icon_id: icon.id, format: :png, theme: :light } if icon_hash[:light]
      variants << { icon_id: icon.id, format: :png, theme: :dark } if icon_hash[:dark]
    end
  end

  variants
end

IconVariant.upsert_all(icon_variants, unique_by: %i[icon_id format theme])

# Delete icons without variants
Icon.where.missing(:icon_variants).delete_all

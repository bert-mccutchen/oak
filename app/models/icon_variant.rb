# frozen_string_literal: true

class IconVariant < ApplicationRecord
  broadcasts_refreshes

  belongs_to :icon

  enum :format, {
    svg: 0,
    png: 1
  }, validate: true

  enum :theme, {
    default: 0,
    light: 1,
    dark: 2
  }, validate: true, suffix: true

  delegate :slug, :name, :tags, to: :icon

  def filename
    @filename ||= default_theme? ? "#{slug}.#{format}" : "#{slug}-#{theme}.#{format}"
  end

  def path
    @path ||= "vendor/images/selfhst/icons/#{format}/#{filename}"
  end
end

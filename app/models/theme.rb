# frozen_string_literal: true

class Theme < ApplicationRecord
  include Identifiable

  attribute :custom, default: true
  attribute :enabled, default: true

  identifies_by :token
  has_secure_token :token

  broadcasts_refreshes

  validates :token, :name, presence: true

  scope :custom, -> { where(custom: true) }
  scope :standard, -> { where(custom: false) }
  scope :enabled, -> { where(enabled: true) }

  enum :color_scheme, {
    dark: 0,
    light: 1
  }, validate: true

  def self.default
    find_by(name: "Forest", custom: false)
  end
end

class Icon < ApplicationRecord
  include Identifiable

  identifies_by :slug
  broadcasts_refreshes

  has_many :applications, dependent: :nullify
  has_many :icon_variants, dependent: :destroy

  validates :slug, :name, presence: true

  def best_variant
    @best_variant ||= icon_variants.order(:format, :theme).first
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[name tags]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end

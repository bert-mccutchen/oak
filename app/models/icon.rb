class Icon < ApplicationRecord
  broadcasts_refreshes

  has_many :icon_variants, dependent: :destroy

  validates :slug, :name, presence: true
end

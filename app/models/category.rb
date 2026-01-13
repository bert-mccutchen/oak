class Category < ApplicationRecord
  include Identifiable

  identifies_by :token
  has_secure_token :token

  acts_as_list

  broadcasts_refreshes

  has_many :bookmarks, dependent: :destroy

  validates :token, :name, presence: true

  scope :enabled, -> { where(enabled: true) }
end

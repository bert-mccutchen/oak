class Application < ApplicationRecord
  include Identifiable

  identifies_by :token
  has_secure_token :token

  acts_as_list

  broadcasts_refreshes

  belongs_to :icon, optional: true

  validates :token, :name, :url, presence: true
end

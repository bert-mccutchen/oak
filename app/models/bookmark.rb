class Bookmark < ApplicationRecord
  include Identifiable

  identifies_by :token
  has_secure_token :token

  acts_as_list scope: :category

  broadcasts_refreshes

  belongs_to :category

  validates :token, :name, :url, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[name url]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end

# frozen_string_literal: true

class Application < ApplicationRecord
  include Identifiable

  identifies_by :token
  has_secure_token :token

  acts_as_list

  broadcasts_refreshes

  belongs_to :icon, optional: true

  validates :token, :name, :url, presence: true

  scope :enabled, -> { where(enabled: true) }

  def positionable?
    Setting[:applications_order] == "position"
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[name url]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end

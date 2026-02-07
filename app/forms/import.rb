# frozen_string_literal: true

class Import
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :host, :string

  validates :host, presence: true

  def process
    return false unless valid?

    FlameImportService.new(host).import!

    true
  rescue StandardError => e
    errors.add(:host, e.message)
    false
  end
end

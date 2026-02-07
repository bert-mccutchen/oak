# frozen_string_literal: true

class Quote < ApplicationRecord
  include Identifiable

  identifies_by :token
  has_secure_token :token

  acts_as_list

  broadcasts_refreshes

  after_commit :clear_daily_pick, if: :daily_pick?

  validates :token, :quote, :author, presence: true

  def daily_pick?
    Quote.daily_pick == self
  end

  def self.daily_pick
    Rails.cache.fetch("quote/daily_pick", expires_at: Time.current.end_of_day) do
      Quote.order("RANDOM()").limit(1).first
    end
  end

  private

  def clear_daily_pick
    Rails.cache.delete("quote/daily_pick")
  end
end

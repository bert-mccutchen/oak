class Current < ActiveSupport::CurrentAttributes
  attribute :theme, default: -> { defaulted_theme }
  attribute :greeting, default: -> { timed_greeting }
  attribute :quote, default: -> { Quote.daily_pick }

  private

  def self.defaulted_theme
    Theme.find_by(slug: Setting[:theme]) || Theme.default
  end
  private_class_method :defaulted_theme

  def self.timed_greeting
    Time.use_zone(Setting["time_zone"]) do
      case Time.current.hour
      when 5..11
        Setting["morning_greeting"]
      when 12..16
        Setting["afternoon_greeting"]
      when 17..20
        Setting["evening_greeting"]
      else
        Setting["night_greeting"]
      end
    end
  end
  private_class_method :timed_greeting
end

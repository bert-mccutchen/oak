class Current < ActiveSupport::CurrentAttributes
  attribute :theme, default: -> { Theme.find_by(slug: Setting[:theme]) || Theme.default }
  attribute :greeting, default: -> { GreetingService.current }
  attribute :quote, default: -> { Quote.daily_pick }
end

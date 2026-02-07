# frozen_string_literal: true

require "open_meteo"

module SettingsHelper
  # August 6th 1991 - the first website launched.
  EXAMPLE_DATE = Time.new(1991, 8, 6, 17, 4, 2).freeze

  DATE_FORMATTERS = [
    { directives: [ "%Y", "%C", "%y" ], description: "Year with century, century, or year without century" },
    { directives: [ "%m", "%_m", "%-m" ], description: "Month of the year: zero-padded, blank-padded, or no-padding" },
    { directives: [ "%B", "%b" ], description: "Full month name, or abbreviated month name" },
    { directives: [ "%d", "%e", "%-d" ], description: "Day of the month: zero-padded, blank-padded, or no-padding" },
    { directives: [ "%j" ], description: "Day of the year" },
    { directives: [ "%A", "%a" ], description: "Full weekday name, or abbreviated weekday name" },
    { directives: [ "%D" ], description: "Date in mm/dd/yy format" },
    { directives: [ "%F" ], description: "Date in YYYY-MM-DD (ISO 8601) format" }
  ].freeze

  TIME_FORMATTERS = [
    { directives: [ "%H", "%k" ], description: "Hour of the day (24 hour clock): zero padded, or blank-padded" },
    { directives: [ "%I", "%l" ], description: "Hour of the day (12 hour clock): zero padded, or blank-padded" },
    { directives: [ "%P" ], description: "Meridian indicator" },
    { directives: [ "%M" ], description: "Minute of the hour" },
    { directives: [ "%S" ], description: "Second of the minute" }
  ].freeze

  def directive_format(directive)
    directive.join(", ")
  end

  def directive_example(directive)
    directive.map { |d| "\"#{EXAMPLE_DATE.strftime(d)}\"" }.join(", ")
  end
end

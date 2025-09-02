##
# Theme Settings
#
Setting.create!(
  slug: "theme",
  name: "Theme",
  description: "The theme of the application.",
  default: "coffee",
  value_type: :string
)

##
# Greeting Settings
#
Setting.create!(
  slug: "greetings_enabled",
  name: "Show Greetings",
  description: "Whether or not to show greetings.",
  default: 1,
  value_type: :boolean
)

Setting.create!(
  slug: "quotes_enabled",
  name: "Show Quotes",
  description: "Whether or not to show quotes.",
  default: 1,
  value_type: :boolean
)

Setting.create!(
  slug: "morning_greeting",
  name: "Morning Greeting",
  description: "The large greeting you will see in the morning.",
  default: "Good morning.",
  value_type: :string
)

Setting.create!(
  slug: "afternoon_greeting",
  name: "Afternoon Greeting",
  description: "The large greeting you will see in the afternoon.",
  default: "Good afternoon.",
  value_type: :string
)

Setting.create!(
  slug: "evening_greeting",
  name: "Evening Greeting",
  description: "The large greeting you will see in the evening.",
  default: "Good evening.",
  value_type: :string
)

Setting.create!(
  slug: "night_greeting",
  name: "Nighttime Greeting",
  description: "The large greeting you will see at night.",
  default: "Good night.",
  value_type: :string
)

##
# Date/Time Settings
#
Setting.create!(
  slug: "date_enabled",
  name: "Show Date",
  description: "Whether or not to show date information.",
  default: 1,
  value_type: :boolean
)

Setting.create!(
  slug: "date_format",
  name: "Date Format",
  description: "Format used when showing the date.",
  default: "%A, %B %d %Y",
  value_type: :string
)

Setting.create!(
  slug: "time_enabled",
  name: "Show Time",
  description: "Whether or not to show time information.",
  default: 1,
  value_type: :boolean
)

Setting.create!(
  slug: "time_format",
  name: "Time Format",
  description: "Format used when showing the time.",
  default: "%l:%M:%S %P",
  value_type: :string
)

Setting.create!(
  slug: "time_zone",
  name: "Time Zone",
  description: "The time zone of your location. Used for date, time, and greetings.",
  default: "Eastern Time (US & Canada)", # ActiveSupport::TimeZone.all
  value_type: :string
)

##
# Weather Settings
#
Setting.create!(
  slug: "weather_enabled",
  name: "Show Weather",
  description: "Whether or not to show weather information.",
  default: 1,
  value_type: :boolean
)

Setting.create!(
  slug: "temperature_unit",
  name: "Temperature Unit",
  description: "The unit that temperature will be displayed in.",
  default: "celsius", # fahrenheit
  value_type: :string
)

Setting.create!(
  slug: "latitude",
  name: "Weather Latitude",
  description: "The latitude of your city for showing weather information.",
  default: "45.424721", # Canada's Capital
  value_type: :float
)

Setting.create!(
  slug: "longitude",
  name: "Weather Longitude",
  description: "The longitude of your city showing weather information.",
  default: "-75.695000", # Canada's Capital
  value_type: :float
)

##
# Theme Settings
#
Setting.find_or_initialize_by(slug: "theme").update!(
  name: "Theme",
  description: "The theme of the application.",
  default: Theme.default.token,
  value_type: :string
)

##
# Greeting Settings
#
Setting.find_or_initialize_by(slug: "greetings_enabled").update!(
  name: "Show Greetings",
  description: "Whether or not to show greetings.",
  default: 1,
  value_type: :boolean
)

Setting.find_or_initialize_by(slug: "quotes_enabled").update!(
  name: "Show Quotes",
  description: "Whether or not to show quotes.",
  default: 1,
  value_type: :boolean
)

Setting.find_or_initialize_by(slug: "morning_greeting").update!(
  name: "Morning Greeting",
  description: "The large greeting you will see in the morning.",
  default: "Good morning.",
  value_type: :string
)

Setting.find_or_initialize_by(slug: "afternoon_greeting").update!(
  name: "Afternoon Greeting",
  description: "The large greeting you will see in the afternoon.",
  default: "Good afternoon.",
  value_type: :string
)

Setting.find_or_initialize_by(slug: "evening_greeting").update!(
  name: "Evening Greeting",
  description: "The large greeting you will see in the evening.",
  default: "Good evening.",
  value_type: :string
)

Setting.find_or_initialize_by(slug: "night_greeting").update!(
  name: "Nighttime Greeting",
  description: "The large greeting you will see at night.",
  default: "Good night.",
  value_type: :string
)

##
# Application Settings
#
Setting.find_or_initialize_by(slug: "applications_order").update!(
  name: "Applications Order",
  description: "The order of applications.",
  default: "position",
  value_type: :string
)

##
# Category Settings
#
Setting.find_or_initialize_by(slug: "categories_order").update!(
  name: "Categories Order",
  description: "The order of categories.",
  default: "position",
  value_type: :string
)

##
# Bookmark Settings
#
Setting.find_or_initialize_by(slug: "bookmarks_enabled").update!(
  name: "Show Bookmarks",
  description: "Whether or not to show bookmarks.",
  default: 1,
  value_type: :boolean
)

Setting.find_or_initialize_by(slug: "bookmarks_order").update!(
  name: "Bookmarks Order",
  description: "The order of bookmarks.",
  default: "position",
  value_type: :string
)

##
# Date/Time Settings
#
Setting.find_or_initialize_by(slug: "date_enabled").update!(
  name: "Show Date",
  description: "Whether or not to show date information.",
  default: 1,
  value_type: :boolean
)

Setting.find_or_initialize_by(slug: "date_format").update!(
  name: "Date Format",
  description: "Format used when showing the date.",
  default: "%A, %B %d %Y",
  value_type: :string
)

Setting.find_or_initialize_by(slug: "time_enabled").update!(
  name: "Show Time",
  description: "Whether or not to show time information.",
  default: 1,
  value_type: :boolean
)

Setting.find_or_initialize_by(slug: "time_format").update!(
  name: "Time Format",
  description: "Format used when showing the time.",
  default: "%l:%M:%S %P",
  value_type: :string
)

Setting.find_or_initialize_by(slug: "time_zone").update!(
  name: "Time Zone",
  description: "The time zone of your location. Used for date, time, and greetings.",
  default: "Eastern Time (US & Canada)", # ActiveSupport::TimeZone.all
  value_type: :string
)

##
# Weather Settings
#
Setting.find_or_initialize_by(slug: "weather_enabled").update!(
  name: "Show Weather",
  description: "Whether or not to show weather information.",
  default: 1,
  value_type: :boolean
)

Setting.find_or_initialize_by(slug: "temperature_unit").update!(
  name: "Temperature Unit",
  description: "The unit that temperature will be displayed in.",
  default: "celsius", # fahrenheit
  value_type: :string
)

Setting.find_or_initialize_by(slug: "latitude").update!(
  name: "Weather Latitude",
  description: "The latitude of your city for showing weather information.",
  default: "45.424721", # Canada's Capital
  value_type: :float
)

Setting.find_or_initialize_by(slug: "longitude").update!(
  name: "Weather Longitude",
  description: "The longitude of your city showing weather information.",
  default: "-75.695000", # Canada's Capital
  value_type: :float
)


##
# Search Settings
#
Setting.find_or_initialize_by(slug: "search_hotkey").update!(
  name: "Search Hotkey",
  description: "The hotkey to show the search pop-up.",
  default: "meta+k",
  value_type: :string
)

Setting.find_or_initialize_by(slug: "web_search_provider").update!(
  name: "Web Search Provider",
  description: "The search engine provider to use when performing web searches.",
  default: "https://duckduckgo.com",
  value: "https://duckduckgo.com",
  value_type: :string
)

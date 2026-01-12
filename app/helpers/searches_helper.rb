module SearchesHelper
  DEFAULT_HOTKEYS = {
    "⌘ + K" => "meta+k",
    "CTRL + K" => "ctrl+k",
    "Tab" => "tab"
  }.freeze

  DEFAULT_WEB_SEARCH_PROVIDERS = {
    "Duck Duck Go" => "https://duckduckgo.com",
    "Ecosia" => "https://ecosia.org/search",
    "Google" => "https://google.com/search"
  }.freeze

  def custom_web_search_provider?
    DEFAULT_WEB_SEARCH_PROVIDERS.values.exclude?(web_search_provider_url)
  end

  def web_search_provider_name
    DEFAULT_WEB_SEARCH_PROVIDERS.invert[web_search_provider_url] || web_search_provider_url
  end

  def web_search_provider_url
    @web_search_provider_url ||= Setting.raw_value(:web_search_provider)
  end
end

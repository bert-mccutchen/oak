class AddSearchSettings < ActiveRecord::Migration[8.0]
  def up
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
  end

  def down
    Setting.find_by(slug: "search_hotkey")&.destroy
    Setting.find_by(slug: "web_search_provider")&.destroy
  end
end

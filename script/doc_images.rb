require "puppeteer-ruby"

PREFIX = ARGV[0]
WIDTH = ARGV[1].to_i
HEIGHT = ARGV[2].to_i

def reset_cache!
  Rails.cache.delete("setting/theme")
  Rails.cache.write("quote/daily_pick", Quote.first)
end

def change_theme!(token)
  Setting.find_by(slug: "theme").update!(value: token)
  reset_cache!
end

def file_path(dir, name)
  dir_path = Rails.root.join("docs/#{dir}")
  FileUtils.mkdir_p(dir_path)

  "#{dir_path}/#{PREFIX}_#{name}.png"
end

def screenshot(page, url:, path:)
  page.goto(url, wait_until: "networkidle0")
  page.screenshot(path:)
end

Puppeteer.launch(headless: true, args: [ "--window-size=#{WIDTH},#{HEIGHT}", "--disable-cache", "--disk-cache-size=0" ]) do |browser|
  page = browser.new_page
  page.viewport = Puppeteer::Viewport.new(width: WIDTH, height: HEIGHT)

  # Screenshot the theme editing.
  change_theme!(Theme.find_by(name: "Gruvbox").token)
  screenshot(page, url: "http://127.0.0.1:3000/themes/new", path: file_path("assets", "new_theme"))

  # Screenshot various pages as the default theme.
  change_theme!(Theme.default.token)
  screenshot(page, url: "http://127.0.0.1:3000/settings", path: file_path("assets", "settings"))
  screenshot(page, url: "http://127.0.0.1:3000/applications", path: file_path("assets", "applications"))
  screenshot(page, url: "http://127.0.0.1:3000/bookmarks", path: file_path("assets", "bookmarks"))
  screenshot(page, url: "http://127.0.0.1:3000/categories", path: file_path("assets", "categories"))
  screenshot(page, url: "http://127.0.0.1:3000/quotes", path: file_path("assets", "quotes"))
  screenshot(page, url: "http://127.0.0.1:3000/themes", path: file_path("assets", "themes"))

  # Screenshot the homepage as each theme.
  Theme.standard.find_each do |theme|
    change_theme!(theme.token)
    screenshot(page, url: "http://127.0.0.1:3000", path: file_path("assets/themes", theme.name.downcase))
  end
end

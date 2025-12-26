require "puppeteer-ruby"

screenshots_dir = Rails.root.join("docs/assets")
themes_dir = Rails.root.join("docs/assets/themes")
FileUtils.mkdir_p(themes_dir)

def screenshot(browser, url:, path:, wait_for_turbo: false)
  page = browser.new_page
  page.viewport = Puppeteer::Viewport.new(width: 1920, height: 1080)
  page.goto(url, wait_until: "networkidle0")
  page.wait_for_selector('turbo-frame[complete]') if wait_for_turbo
  page.screenshot(path:)
end

Puppeteer.launch(headless: true, args: [ "--window-size=1920,1080" ]) do |browser|
  # Screenshot the theme editing.
  Setting.find_by(slug: "theme").update!(value: Theme.find_by(name: "Gruvbox").token)
  screenshot(browser, url: "http://127.0.0.1:3000/themes/new", path: "#{screenshots_dir}/new_theme.png", wait_for_turbo: true)

  # Screenshot various pages as the default theme.
  Setting.find_by(slug: "theme").update!(value: Theme.default.token)

  screenshot(browser, url: "http://127.0.0.1:3000/settings", path: "#{screenshots_dir}/settings.png")
  screenshot(browser, url: "http://127.0.0.1:3000/applications", path: "#{screenshots_dir}/applications.png")
  screenshot(browser, url: "http://127.0.0.1:3000/bookmarks", path: "#{screenshots_dir}/bookmarks.png")
  screenshot(browser, url: "http://127.0.0.1:3000/categories", path: "#{screenshots_dir}/categories.png")
  screenshot(browser, url: "http://127.0.0.1:3000/quotes", path: "#{screenshots_dir}/quotes.png")
  screenshot(browser, url: "http://127.0.0.1:3000/themes", path: "#{screenshots_dir}/themes.png")

  # Screenshot the homepage as each theme.
  Theme.standard.find_each do |theme|
    Setting.find_by(slug: "theme").update!(value: theme.token)

    screenshot(browser, url: "http://127.0.0.1:3000", path: "#{themes_dir}/#{theme.name.downcase}.png")
  end
end

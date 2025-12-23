##
# Themes
#
Theme.custom.delete_all
Theme.create!(
 name: "Gruvbox",
 color_scheme: "dark",
 color_base_100: "oklch(0.268 0.007 34.298)",
 color_base_200: "oklch(0.374 0.01 67.558)",
 color_base_300: "oklch(0.444 0.011 73.639)",
 color_base_content: "oklch(0.954 0.038 75.164)",
 color_primary: "oklch(0.705 0.213 47.604)",
 color_primary_content: "oklch(0.901 0.076 70.697)",
 color_secondary: "oklch(0.552 0.016 285.938)",
 color_secondary_content: "oklch(0.985 0 0)",
 color_accent: "oklch(0.827 0.119 306.383)",
 color_accent_content: "oklch(0.291 0.149 302.717)",
 color_neutral: "oklch(0.871 0.15 154.449)",
 color_neutral_content: "oklch(0.262 0.051 172.552)",
 color_info: "oklch(0.828 0.111 230.318)",
 color_info_content: "oklch(0% 0 0)",
 color_success: "oklch(0.897 0.196 126.665)",
 color_success_content: "oklch(0% 0 0)",
 color_warning: "oklch(0.879 0.169 91.605)",
 color_warning_content: "oklch(0% 0 0)",
 color_error: "oklch(0.637 0.237 25.331)",
 color_error_content: "oklch(0% 0 0)",
 radius_selector: 0.25,
 radius_field: 0.5,
 radius_box: 0.5,
 size_selector: 0.25,
 size_field: 0.25,
 border: 1.0,
 depth: false,
 noise: true
)

##
# Applications
#
Application.delete_all

Application.create!(
  name: "UniFi OS",
  url: "https://unifi/login",
  icon: Icon.find_by!(slug: "ubiquiti-unifi")
)

Application.create!(
  name: "Unraid",
  url: "https://unraid.local",
  icon: Icon.find_by!(slug: "unraid")
)

Application.create!(
  name: "Unraid Backup",
  url: "https://backup.local",
  icon: Icon.find_by!(slug: "unraid")
)

Application.create!(
  name: "Dokploy",
  url: "https://dokploy.local",
  icon: Icon.find_by!(slug: "dokploy")
)

Application.create!(
  name: "Uptime Kuma",
  url: "http://up.local",
  icon: Icon.find_by!(slug: "uptime-kuma")
)

Application.create!(
  name: "Nextcloud",
  url: "https://next.local",
  icon: Icon.find_by!(slug: "nextcloud")
)

Application.create!(
  name: "Vaultwarden",
  url: "https://vault.local",
  icon: Icon.find_by!(slug: "vaultwarden")
)

Application.create!(
  name: "Home Assistant",
  url: "https://ha.local",
  icon: Icon.find_by!(slug: "home-assistant")
)

Application.create!(
  name: "Jellyfin",
  url: "https://jellyfin.local",
  icon: Icon.find_by!(slug: "jellyfin")
)

Application.create!(
  name: "Jellyfin Stats",
  url: "https://jellystat.local",
  icon: Icon.find_by!(slug: "jellystat")
)

Application.create!(
  name: "Jellyseerr",
  url: "https://jellyseerr.local",
  icon: Icon.find_by!(slug: "jellyseerr")
)

Application.create!(
  name: "Minecraft",
  url: "https://minecraft.local",
  icon: Icon.find_by!(slug: "minecraft")
)

Application.create!(
  name: "Minecraft Stats",
  url: "https://mcstats.local",
  icon: Icon.find_by!(slug: "papermc")
)

Application.create!(
  name: "Unraid Syncthing",
  url: "http://unraid.local:8384",
  icon: Icon.find_by!(slug: "syncthing")
)

Application.create!(
  name: "Backup Syncthing",
  url: "http://backup.local:8384",
  icon: Icon.find_by!(slug: "syncthing")
)

Application.create!(
  name: "Change Detection",
  url: "http://change.local",
  icon: Icon.find_by!(slug: "changedetection")
)

##
# Categories and Bookmarks
#
Bookmark.delete_all
Category.delete_all

category = Category.create!(name: "Lorem Ipsum")
category.bookmarks.create!(name: "Dolor Sit Amet", url: "https://demo.local")
category.bookmarks.create!(name: "Consectetur", url: "https://demo.local")
category.bookmarks.create!(name: "Adipiscing Elit", url: "https://demo.local")
category.bookmarks.create!(name: "Pellentesque Fermentum", url: "https://demo.local")
category.bookmarks.create!(name: "Tincidunt Efficitur", url: "https://demo.local")
category.bookmarks.create!(name: "Fusce Blandit", url: "https://demo.local")
category.bookmarks.create!(name: "Id Metus", url: "https://demo.local")

category = Category.create!(name: "Vivamus Velit")
category.bookmarks.create!(name: "Lectus", url: "https://demo.local")
category.bookmarks.create!(name: "Convallis", url: "https://demo.local")
category.bookmarks.create!(name: "Pharetra", url: "https://demo.local")

category = Category.create!(name: "Ullamcorper Lectus")
category.bookmarks.create!(name: "Pellentesque", url: "https://demo.local")
category.bookmarks.create!(name: "Accumsan", url: "https://demo.local")
category.bookmarks.create!(name: "Eu Est", url: "https://demo.local")
category.bookmarks.create!(name: "Nec", url: "https://demo.local")
category.bookmarks.create!(name: "Vestibulum", url: "https://demo.local")
category.bookmarks.create!(name: "Cras Non", url: "https://demo.local")
category.bookmarks.create!(name: "Magna", url: "https://demo.local")
category.bookmarks.create!(name: "Commodo", url: "https://demo.local")

category = Category.create!(name: "Varius Dolor")
category.bookmarks.create!(name: "Dictum Ligula", url: "https://demo.local")
category.bookmarks.create!(name: "Donec Maximus", url: "https://demo.local")
category.bookmarks.create!(name: "Dictum Feugiat", url: "https://demo.local")

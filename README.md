<img src="docs/assets/logo.svg" height="80px">

A simple homepage for self-hosters.

_100% opinionated — based on [Flame](https://github.com/pawelmalak/flame) and [SUI](https://github.com/jeroenpardon/sui). Fork or make your own if you want something different._

![Default Homepage](./docs/assets/themes/forest.png)

## Features

- Quickly navigate your self-hosted applications.
  - Icons from [selfh.st/icons](https://github.com/selfhst/icons).
  - Icons change color with your theme.
- Keep common bookmarks handy. (optional)
  - Organize them with categories.
- Greetings for good vibes. (optional)
- Daily quotes for extra wisdom. (optional)
- Local weather conditions. (optional)
- Completely customizable.
- 100% mobile friendly.

#### And More!

- Search
  - Global application/bookmark search for quick access (<kbd>⌘</kbd> + <kbd>K</kbd>).
  - Press tab from the global search to enter web search. (optional)
  - Configurable hotkey and search engine.
- Theme
  - Create your own themes using a custom theme builder.
  - Clone existing themes and tweak theme.
  - Disable any theme you don't want to see.
- Migrate
  - Move from [Flame](https://github.com/pawelmalak/flame) to Oak easily with a built-in import utility.

### Uhh... No Logins?

Like many self-hosted applications, Oak is not intended to be hosted publicly. Don't open it up to the internet.

## Usage

### Docker

This application uses SQLite for storage. You must mount your desired database storage path to `/rails/storage`.

#### Example

```
docker run -d -it -p 3000:80 -v /path/on/host:/rails/storage ghcr.io/bert-mccutchen/oak:latest
```

### Unraid

You need to change your storage directory ownership for Oak.

```
chown 1000:1000 /mnt/cache/appdata/oak
```

## Screenshots

### Self-Host

![Applications Page](docs/assets/applications.png)

### Bookmark

![Bookmarks Page](docs/assets/bookmarks.png)

![Categories Page](docs/assets/categories.png)

### Customize

![Settings Page](docs/assets/settings.png)

![Quotes Page](docs/assets/quotes.png)

![Themes Page](docs/assets/themes.png)

![New Theme Page](docs/assets/new_theme.png)

<details>
<summary><b>Standard Themes</b></summary>

| Abyss | Acid |
|---|---|
| ![Abyss Homepage](docs/assets/themes/abyss.png) | ![Acid Homepage](docs/assets/themes/acid.png) |

| Aqua | Autumn |
|---|---|
| ![Aqua Homepage](docs/assets/themes/aqua.png) | ![Autumn Homepage](docs/assets/themes/autumn.png) |

| Black | Bumblebee |
|---|---|
| ![Black Homepage](docs/assets/themes/black.png) | ![Bumblebee Homepage](docs/assets/themes/bumblebee.png) |

| Business | Caramellatte |
|---|---|
| ![Business Homepage](docs/assets/themes/business.png) | ![Caramellatte Homepage](docs/assets/themes/caramellatte.png) |

| Cmyk | Coffee |
|---|---|
| ![Cmyk Homepage](docs/assets/themes/cmyk.png) | ![Coffee Homepage](docs/assets/themes/coffee.png) |

| Corporate | Cupcake |
|---|---|
| ![Corporate Homepage](docs/assets/themes/corporate.png) | ![Cupcake Homepage](docs/assets/themes/cupcake.png) |

| Cyberpunk | Dark |
|---|---|
| ![Cyberpunk Homepage](docs/assets/themes/cyberpunk.png) | ![Dark Homepage](docs/assets/themes/dark.png) |

| Dim | Dracula |
|---|---|
| ![Dim Homepage](docs/assets/themes/dim.png) | ![Dracula Homepage](docs/assets/themes/dracula.png) |

| Emerald | Fantasy |
|---|---|
| ![Emerald Homepage](docs/assets/themes/emerald.png) | ![Fantasy Homepage](docs/assets/themes/fantasy.png) |

| Forest | Garden |
|---|---|
| ![Forest Homepage](docs/assets/themes/forest.png) | ![Garden Homepage](docs/assets/themes/garden.png) |

| Halloween | Lemonade |
|---|---|
| ![Halloween Homepage](docs/assets/themes/halloween.png) | ![Lemonade Homepage](docs/assets/themes/lemonade.png) |

| Light | Lofi |
|---|---|
| ![Light Homepage](docs/assets/themes/light.png) | ![Lofi Homepage](docs/assets/themes/lofi.png) |

| Luxury | Night |
|---|---|
| ![Luxury Homepage](docs/assets/themes/luxury.png) | ![Night Homepage](docs/assets/themes/night.png) |

| Nord | Pastel |
|---|---|
| ![Nord Homepage](docs/assets/themes/nord.png) | ![Pastel Homepage](docs/assets/themes/pastel.png) |

| Retro | Silk |
|---|---|
| ![Retro Homepage](docs/assets/themes/retro.png) | ![Silk Homepage](docs/assets/themes/silk.png) |

| Sunset | Synthwave |
|---|---|
| ![Sunset Homepage](docs/assets/themes/sunset.png) | ![Synthwave Homepage](docs/assets/themes/synthwave.png) |

| Valentine | Winter |
|---|---|
| ![Valentine Homepage](docs/assets/themes/valentine.png) | ![Winter Homepage](docs/assets/themes/winter.png) |

| Wireframe |
|---|
| ![Wireframe Homepage](docs/assets/themes/wireframe.png) |
</details>

## Mobile Screenshots

| | | | |
|---|---|---|---|
| ![Forest Homepage](docs/assets/themes/mobile_forest.png) | ![Applications Page](docs/assets/mobile_applications.png) | ![Bookmarks Page](docs/assets/mobile_bookmarks.png) | ![Categories Page](docs/assets/mobile_categories.png) |
| ![Settings Page](docs/assets/mobile_settings.png) | ![Quotes Page](docs/assets/mobile_quotes.png) | ![Themes Page](docs/assets/mobile_themes.png) | ![New Theme Page](docs/assets/mobile_new_theme.png) |

<details>
<summary><b>Standard Themes (Mobile)</b></summary>

| Abyss | Acid | Aqua | Autumn |
|---|---|---|---|
| ![Abyss Homepage](docs/assets/themes/mobile_abyss.png) | ![Acid Homepage](docs/assets/themes/mobile_acid.png) | ![Aqua Homepage](docs/assets/themes/mobile_aqua.png) | ![Autumn Homepage](docs/assets/themes/mobile_autumn.png) |

| Black | Bumblebee | Business | Caramellatte |
|---|---|---|---|
| ![Black Homepage](docs/assets/themes/mobile_black.png) | ![Bumblebee Homepage](docs/assets/themes/mobile_bumblebee.png) | ![Business Homepage](docs/assets/themes/mobile_business.png) | ![Caramellatte Homepage](docs/assets/themes/mobile_caramellatte.png) |

| Cmyk | Coffee | Corporate | Cupcake |
|---|---|---|---|
| ![Cmyk Homepage](docs/assets/themes/mobile_cmyk.png) | ![Coffee Homepage](docs/assets/themes/mobile_coffee.png) | ![Corporate Homepage](docs/assets/themes/mobile_corporate.png) | ![Cupcake Homepage](docs/assets/themes/mobile_cupcake.png) |

| Cyberpunk | Dark | Dim | Dracula |
|---|---|---|---|
| ![Cyberpunk Homepage](docs/assets/themes/mobile_cyberpunk.png) | ![Dark Homepage](docs/assets/themes/mobile_dark.png) | ![Dim Homepage](docs/assets/themes/mobile_dim.png) | ![Dracula Homepage](docs/assets/themes/mobile_dracula.png) |

| Emerald | Fantasy | Forest | Garden |
|---|---|---|---|
| ![Emerald Homepage](docs/assets/themes/mobile_emerald.png) | ![Fantasy Homepage](docs/assets/themes/mobile_fantasy.png) | ![Forest Homepage](docs/assets/themes/mobile_forest.png) | ![Garden Homepage](docs/assets/themes/mobile_garden.png) |

| Halloween | Lemonade | Light | Lofi |
|---|---|---|---|
| ![Halloween Homepage](docs/assets/themes/mobile_halloween.png) | ![Lemonade Homepage](docs/assets/themes/mobile_lemonade.png) | ![Light Homepage](docs/assets/themes/mobile_light.png) | ![Lofi Homepage](docs/assets/themes/mobile_lofi.png) |

| Luxury | Night | Nord | Pastel |
|---|---|---|---|
| ![Luxury Homepage](docs/assets/themes/mobile_luxury.png) | ![Night Homepage](docs/assets/themes/mobile_night.png) | ![Nord Homepage](docs/assets/themes/mobile_nord.png) | ![Pastel Homepage](docs/assets/themes/mobile_pastel.png) |

| Retro | Silk | Sunset | Synthwave |
|---|---|---|---|
| ![Retro Homepage](docs/assets/themes/mobile_retro.png) | ![Silk Homepage](docs/assets/themes/mobile_silk.png) | ![Sunset Homepage](docs/assets/themes/mobile_sunset.png) | ![Synthwave Homepage](docs/assets/themes/mobile_synthwave.png) |

| Valentine | Winter | Wireframe |
|---|---|---|
| ![Valentine Homepage](docs/assets/themes/mobile_valentine.png) | ![Winter Homepage](docs/assets/themes/mobile_winter.png) | ![Wireframe Homepage](docs/assets/themes/mobile_wireframe.png) |
</details>

## Thanks

Big thanks to [DaisyUI](https://github.com/saadeghi/daisyui) for the component library and themes. Also [Flame](https://github.com/pawelmalak/flame), which has been the inpiration and my homepage for many years.

### Legal Attributions

Icons are modified and colored programatically to match the user's theme. Icons are provided by [selfh.st/icons](https://github.com/selfhst/icons/blob/main/LICENSE), and [Font Awesome Free](https://fontawesome.com/license/free) under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/deed).

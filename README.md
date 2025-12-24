# Oak

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
- Local temperature. (optional)
- Completely customizable.
- 100% mobile friendly.

### Uhh... No Logins?

Like many self-hosted applications, Oak is not intended to be hosted publicly. Don't open it up to the internet.

## Usage

### Docker

This application uses SQLite for storage. You must mount your desired database storage path to `/rails/storage`.

#### Example

```
docker run -d -it -p 3000:80 -v /path/on/host:/rails/storage ghcr.io/bert-mccutchen/oak:latest
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

#### Abyss
![Abyss Homepage](docs/assets/themes/abyss.png)

#### Acid
![Acid Homepage](docs/assets/themes/acid.png)

#### Aqua
![Aqua Homepage](docs/assets/themes/aqua.png)

#### Autumn
![Autumn Homepage](docs/assets/themes/autumn.png)

#### Black
![Black Homepage](docs/assets/themes/black.png)

#### Bumblebee
![Bumblebee Homepage](docs/assets/themes/bumblebee.png)

#### Business
![Business Homepage](docs/assets/themes/business.png)

#### Caramellatte
![Caramellatte Homepage](docs/assets/themes/caramellatte.png)

#### Cmyk
![Cmyk Homepage](docs/assets/themes/cmyk.png)

#### Coffee
![Coffee Homepage](docs/assets/themes/coffee.png)

#### Corporate
![Corporate Homepage](docs/assets/themes/corporate.png)

#### Cupcake
![Cupcake Homepage](docs/assets/themes/cupcake.png)

#### Cyberpunk
![Cyberpunk Homepage](docs/assets/themes/cyberpunk.png)

#### Dark
![Dark Homepage](docs/assets/themes/dark.png)

#### Dim
![Dim Homepage](docs/assets/themes/dim.png)

#### Dracula
![Dracula Homepage](docs/assets/themes/dracula.png)

#### Emerald
![Emerald Homepage](docs/assets/themes/emerald.png)

#### Fantasy
![Fantasy Homepage](docs/assets/themes/fantasy.png)

#### Forest
![Forest Homepage](docs/assets/themes/forest.png)

#### Garden
![Garden Homepage](docs/assets/themes/garden.png)

#### Halloween
![Halloween Homepage](docs/assets/themes/halloween.png)

#### Lemonade
![Lemonade Homepage](docs/assets/themes/lemonade.png)

#### Light
![Light Homepage](docs/assets/themes/light.png)

#### Lofi
![Lofi Homepage](docs/assets/themes/lofi.png)

#### Luxury
![Luxury Homepage](docs/assets/themes/luxury.png)

#### Night
![Night Homepage](docs/assets/themes/night.png)

#### Nord
![Nord Homepage](docs/assets/themes/nord.png)

#### Pastel
![Pastel Homepage](docs/assets/themes/pastel.png)

#### Retro
![Retro Homepage](docs/assets/themes/retro.png)

#### Silk
![Silk Homepage](docs/assets/themes/silk.png)

#### Sunset
![Sunset Homepage](docs/assets/themes/sunset.png)

#### Synthwave
![Synthwave Homepage](docs/assets/themes/synthwave.png)

#### Valentine
![Valentine Homepage](docs/assets/themes/valentine.png)

#### Winter
![Winter Homepage](docs/assets/themes/winter.png)

#### Wireframe
![Wireframe Homepage](docs/assets/themes/wireframe.png)
</details>

## Thanks

Big thanks to [DaisyUI](https://github.com/saadeghi/daisyui) for the component library and themes. Also [Flame](https://github.com/pawelmalak/flame), which has been the inpiration and my homepage for many years.

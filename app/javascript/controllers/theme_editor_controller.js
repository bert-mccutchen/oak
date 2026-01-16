import { Controller } from "@hotwired/stimulus"

export default class ThemeEditorController extends Controller {
  static values = {
    styleId: String,
    settings: Object
  }

  static targets = ["preview"]

  connect() {
    this.previewTimeout = null
  }

  setting(key) {
    return this.settingsValue[key]
  }

  update(event) {
    this.settingsValue = {
      ...this.settingsValue,
      [event.target.dataset.setting]: event.target.value
    }
  }

  updateBoolean(event) {
    this.settingsValue = {
      ...this.settingsValue,
      [event.target.dataset.setting]: event.target.checked
    }
  }

  settingsValueChanged() {
    document.getElementById(this.styleIdValue).innerText = this.styles

    if (this.previewTimeout) clearTimeout(this.previewTimeout)
    this.previewTimeout = setTimeout(() => this.#preview(), 1000)
  }

  #preview() {
    const [url, query_string] = this.previewTarget.src.split("?")

    const params = new URLSearchParams(query_string)
    params.set('color', this.setting("color_primary"))

    this.previewTarget.src = `${url}?${params.toString()}`
    this.previewTarget.reload()
  }

  get styles() {
    return `:root:has(input.theme-controller[value="${this.setting("token")}"]:checked),
    [data-theme="${this.setting("token")}"] {
      color-scheme: ${this.setting("color_scheme")};
      --color-base-100: ${this.setting("color_base_100")};
      --color-base-200: ${this.setting("color_base_200")};
      --color-base-300: ${this.setting("color_base_300")};
      --color-base-content: ${this.setting("color_base_content")};
      --color-primary: ${this.setting("color_primary")};
      --color-primary-content: ${this.setting("color_primary_content")};
      --color-secondary: ${this.setting("color_secondary")};
      --color-secondary-content: ${this.setting("color_secondary_content")};
      --color-accent: ${this.setting("color_accent")};
      --color-accent-content: ${this.setting("color_accent_content")};
      --color-neutral: ${this.setting("color_neutral")};
      --color-neutral-content: ${this.setting("color_neutral_content")};
      --color-info: ${this.setting("color_info")};
      --color-info-content: ${this.setting("color_info_content")};
      --color-success: ${this.setting("color_success")};
      --color-success-content: ${this.setting("color_success_content")};
      --color-warning: ${this.setting("color_warning")};
      --color-warning-content: ${this.setting("color_warning_content")};
      --color-error: ${this.setting("color_error")};
      --color-error-content: ${this.setting("color_error_content")};
      --radius-selector: ${this.setting("radius_selector")}rem;
      --radius-field: ${this.setting("radius_field")}rem;
      --radius-box: ${this.setting("radius_box")}rem;
      --size-selector: ${this.setting("size_selector")}rem;
      --size-field: ${this.setting("size_field")}rem;
      --border: ${this.setting("border")}px;
      --depth: ${this.setting("depth") ? 1 : 0};
      --noise: ${this.setting("noise") ? 1 : 0};
    }`
  }
}

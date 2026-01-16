import { Controller } from "@hotwired/stimulus"

export default class OklchPickerFormController extends Controller {
  static oklchRegex = /oklch\s*\(\s*(?<l>[0-9.]+)%?\s+(?<c>[0-9.]+)\s+(?<h>[0-9.]+)(?:deg)?\s*\)/i

  static targets = ["modal", "input", "lightness", "chroma", "hue", "preview"]

  static values = {
    oklch: { tyle: String, default: "oklch(0 0 0)" },
    lightness: { type: Number, default: 0 },
    chroma: { type: Number, default: 0 },
    hue: { type: Number, default: 0 }
  }

  inputTargetConnected(element) {
    this.oklchValue = element.value
  }

  oklchValueChanged() {
    this.reset()
  }

  lightnessValueChanged() {
    this.#update(this.lightnessTargets, this.lightnessValue)
  }

  chromaValueChanged() {
    this.#update(this.chromaTargets, this.chromaValue)
  }

  hueValueChanged() {
    this.#update(this.hueTargets, this.hueValue)
  }

  reset() {
    const { l, c, h } = this.#parseOklch(this.oklchValue)

    this.lightnessValue = l
    this.chromaValue = c
    this.hueValue = h
  }

  showModal() {
    this.modalTarget.showModal()
  }

  close() {
    this.modalTarget.close()
  }

  lightness(event) {
    this.lightnessValue = event.target.value
  }

  chroma(event) {
    this.chromaValue = event.target.value
  }

  hue(event) {
    this.hueValue = event.target.value
  }

  #parseOklch(value) {
    const matches = value.match(OklchPickerFormController.oklchRegex)

    return {
      l: (value.includes("%") ? matches.groups.l / 100 : matches.groups.l),
      c: matches.groups.c,
      h: matches.groups.h
    }
  }

  #buildOklch(opts = {}) {
    let { l, c, h } = opts

    l = (l === undefined ? this.lightnessValue : l)
    c = (c === undefined ? this.chromaValue : c)
    h = (h === undefined ? this.hueValue : h)

    return `oklch(${l} ${c} ${h})`
  }

  #update(targets, value) {
    this.#updateTargets(targets, value)
    this.#updateRanges()
    this.#updateOklch()
    this.#updatePreview()
  }

  #updateTargets(targets, value) {
    targets.forEach((t) => t.value = value.toFixed(4))
  }

  #updateRanges() {
    this.lightnessTarget.style = this.#rangeStyle([{ l: 0 }, { l: 1 }])
    this.chromaTarget.style = this.#rangeStyle([{ c: 0 }, { c: 0.4 }])
    this.hueTarget.style = this.#rangeStyle(
      Array.from({ length: 361 }, (_, i) => ({ h: 0 + i }))
    )
  }

  #updateOklch() {
    this.inputTarget.value = this.#buildOklch()
    this.inputTarget.dispatchEvent(new Event("input", { bubbles: true }))
  }

  #updatePreview() {
    this.previewTarget.style = `background-color: ${this.#buildOklch()}`
  }

  #rangeStyle(steps) {
    const oklchColors = steps.map((s) => this.#buildOklch(s))

    return `
      --range-fill: 0;
      --range-bg: unset;
      --range-thumb: ${this.#buildOklch({ l: Math.round(this.lightnessValue), c: 0, h: 0 })};
      color: ${this.#buildOklch({ l: Math.round(1 - this.lightnessValue), c: 0, h: 0 })};
      background: linear-gradient(to right, ${oklchColors.join(", ")})
    `
  }
}

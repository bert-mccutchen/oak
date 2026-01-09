import { Controller } from "@hotwired/stimulus"

export default class NoticeController extends Controller {
  static targets = ["modal", "frame", "input", "result"]

  static values = {
    url: String,
    focusIndex: { type: Number, default: -1 }
  }

  focusIndexValueChanged() {
    if (!this.hasInputTarget) return

    if (this.focusIndexValue === -1) {
      this.inputTarget.focus()
    } else {
      this.resultTargets[this.focusIndexValue].focus()
    }
  }

  resultTargetConnected() {
    this.#resetFocus()
  }

  resultTargetDisconnected() {
    this.#resetFocus()
  }

  hotkey(event) {
    event.preventDefault()
    this.show()
  }

  navigate(event) {
    if (!this.modalTarget.open) return

    if (event.key === "ArrowUp") {
      this.#focusPreviousResult()
      event.preventDefault()
    }

    if (event.key === "ArrowDown" || event.key === "Tab") {
      this.#focusNextResult()
      event.preventDefault()
    }
  }

  show() {
    this.modalTarget.showModal()
    this.#reset()
  }

  hide() {
    this.modalTarget.close()
  }

  #resetFocus() {
    this.focusIndexValue = -1
  }

  #reset() {
    this.frameTarget.src = this.frameTarget.dataset.url
    this.frameTarget.innerHTML = null
    this.frameTarget.reload()
    this.#resetFocus()
  }

  #focusNextResult() {
    this.focusIndexValue = Math.min(this.focusIndexValue + 1, this.resultTargets.length - 1)
  }

  #focusPreviousResult() {
    this.focusIndexValue = Math.max(this.focusIndexValue - 1, -1)
  }
}

import { Controller } from "@hotwired/stimulus"

export default class NoticeController extends Controller {
  static targets = [
    "modal",
    "frame",
    "selfSearch",
    "webSearch",
    "selfInput",
    "webInput",
    "result"
  ]

  static values = {
    url: String,
    focusIndex: { type: Number, default: -1 }
  }

  focusIndexValueChanged() {
    if (!this.hasSelfInputTarget) return

    if (this.focusIndexValue === -1) {
      this.selfInputTarget.focus()
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
    if (this.modalTarget.open) return

    event.preventDefault()
    this.show()
  }

  switch(event) {
    if (!this.hasWebInputTarget) return

    event.preventDefault()

    this.selfSearchTarget.classList.toggle("hidden")
    this.webSearchTarget.classList.toggle("hidden")

    if (this.selfSearchTarget.classList.contains("hidden")) {
      this.webInputTarget.focus()
    } else {
      this.selfInputTarget.focus()
    }
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

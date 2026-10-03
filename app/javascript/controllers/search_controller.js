import { Controller } from "@hotwired/stimulus"

export default class SearchController extends Controller {
  static PULL_TO_SEARCH_DISTANCE = 100.0

  static targets = [
    "pull",
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

  connect() {
    this.#pullToSearchReset()

    this.touchStartListener = document.addEventListener('touchstart', this.#pullToSearchTouchStart.bind(this));
    this.touchMoveListener = document.addEventListener('touchmove', this.#pullToSearchTouchMove.bind(this))
    this.touchEndListener = document.addEventListener('touchend', this.#pullToSearchTouchEnd.bind(this))
  }

  disconnect() {
    document.removeEventListener('touchstart', this.touchStartListener)
    document.removeEventListener('touchmove', this.touchMoveListener)
    document.removeEventListener('touchend', this.touchEndListener)
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

  #pullToSearchReset() {
    this.touchstartY = 0
    this.touchDiff = 0
    this.pullTarget.style.opacity = 0
  }

  #pullToSearchTouchStart(event) {
    if (this.modalTarget.open) return

    this.touchstartY = event.touches[0].clientY;
  }

  #pullToSearchTouchMove(event) {
    if (this.modalTarget.open) return

    this.touchDiff = event.touches[0].clientY - this.touchstartY

    if (this.touchDiff > 0 && window.scrollY === 0) {
      this.pullTarget.style.opacity = this.touchDiff / (SearchController.PULL_TO_SEARCH_DISTANCE * 2)
      event.preventDefault()
    } else {
      this.pullTarget.style.opacity = 0
    }
  }

  #pullToSearchTouchEnd(event) {
    if (this.modalTarget.open) return

    if (this.touchDiff > SearchController.PULL_TO_SEARCH_DISTANCE && window.scrollY === 0) {
      this.show()
    } else {
      this.hide()
    }

    this.#pullToSearchReset()
  }
}

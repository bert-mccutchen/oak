import { Controller } from "@hotwired/stimulus"

export default class NoticeController extends Controller {
  MINIMIZE_DELAY = 750

  static values = {
    duration: String
  }

  connect() {
    if (!this.durationValue) return;

    setTimeout(() => this.#hide(), this.durationValue)
  }

  #hide() {
    this.element.classList.add("opacity-0")
    setTimeout(() => this.#minimize(), this.MINIMIZE_DELAY)
  }

  #minimize() {
    this.element.classList.add("notice-minimized")
  }
}

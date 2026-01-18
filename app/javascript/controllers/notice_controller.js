import { Controller } from "@hotwired/stimulus"

export default class NoticeController extends Controller {
  static values = {
    duration: String
  }

  connect() {
    if (!this.durationValue) return;

    setTimeout(() => this.#minimize(), this.durationValue)
  }

  #minimize() {
    this.element.classList.add("notice-minimized")
  }
}

import { Controller } from "@hotwired/stimulus"

export default class DebounceController extends Controller {
  static WAIT = 250

  connect() {
    this.timeout = null
  }

  submit(event) {
    if (!this.#isTypingEvent(event)) return

    if (this.timeout) clearTimeout(this.timeout)

    this.timeout = setTimeout(() => this.#requestSubmit(), DebounceController.WAIT)
  }

  #isTypingEvent(event) {
    return event.key == "Backspace" || (
      !event.altKey && !event.ctrlKey && !event.metaKey && event.key.length === 1
    )
  }

  #requestSubmit() {
    this.element.requestSubmit();
  }
}

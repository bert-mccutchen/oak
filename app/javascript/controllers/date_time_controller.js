import { Controller } from "@hotwired/stimulus"
import strftime from "strftime"

export default class DateTimeController extends Controller {
  static values = {
    timeZone: String,
    format: String
  }

  get timeZone() {
    return strftime.timezone(this.timeZoneValue.replace(":", ""))
  }

  connect() {
    this.interval = setInterval(() => this.#update(), 1000)
  }

  disconnect() {
    if (this.interval) clearInterval(this.interval)
  }

  #synchronize(fn) {
    setTimeout(fn, 1000 - new Date().getMilliseconds())
  }

  #update() {
    this.#synchronize(() => {
      this.element.innerHTML = this.timeZone(this.formatValue, new Date())
    })
  }
}

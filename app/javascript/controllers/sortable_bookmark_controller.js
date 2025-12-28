import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"
import { patch } from "@rails/request.js"

export default class SortableBookmarkController extends Controller {
  static values = {
    handle: String
  }

  connect() {
    this.sortable = new Sortable(this.element, {
      group: "bookmarks",
      animation: 100,
      onAdd: this.#onChange.bind(this),
      onUpdate: this.#onChange.bind(this),
      handle: this.handleValue
    })
  }

  disconnect() {
    this.sortable.destroy()
    this.sortable = undefined
  }

  async #onChange({ item, to, newIndex }) {
    const data = new FormData()
    data.append("bookmark[position]", newIndex + 1)
    data.append("bookmark[category_id]", to.dataset.id)

    console.log(item.dataset.url)
    console.log(data)
    return await patch(item.dataset.url, { body: data, responseKind: "html" })
  }
}

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input"]

  connect() {
    this.submitting = false
  }

  markSubmitting(event) {
    if (this.submitting) event.preventDefault()
    else this.submitting = true
  }

  submitFormIfPresent() {
    if (this.submitting) return

    if (this.inputTarget.value.trim()) this.element.requestSubmit()
    else this.cancelNew()
  }

  abort(event) {
    event.preventDefault()
    history.back()
  }

  cancelNew(event) {
    event?.preventDefault()
    this.element.closest("turbo-frame").innerHTML = ""
  }
}

import { Controller } from '@hotwired/stimulus'
import { Modal } from 'bootstrap'

document.addEventListener("turbo:before-cache", function() {
  let modals = document.querySelectorAll('[data-controller="turbo-modal"]')
  modals.forEach(function(modal) {
    let parentTurboFrame = modal.closest('turbo-frame')
    if (parentTurboFrame) {
      parentTurboFrame.innerHTML = ''
      parentTurboFrame.src = null
    } else {
      modal.remove()
    }
  })
})

export default class extends Controller {
  connect() {
    console.log('Контроллер turbo-modal подключен')

    this.modal = new Modal(this.element)
    this.modal.show()

    const myInput = document.querySelector('.focus-input')
    document.addEventListener('shown.bs.modal', function () {
      myInput.focus()
    })
  }

  isOpen() {
    return this.element.classList.contains("show")
  }

  disconnect() {
    console.log('Контроллер turbo-modal отключен')

    this.modal.hide()
  }

  hideModal() {
    this.element.parentElement.removeAttribute('src')
    this.modal.hide()
  }

  submitEnd(e) {
    console.log(e.detail.success)

    if (e.detail.success) {
      this.hideModal()
    }
  }

  closeWithKeyboard(e) {
    if (e.code === 'Escape') {
      this.hideModal()
    }
  }
  
  closeBackground(e) {
    if (e && this.modalTarget.contains(e.target)) {
      return;
    }
    this.hideModal()
  }
}


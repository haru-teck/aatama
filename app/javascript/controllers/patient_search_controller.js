import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "input", "results" ]

  search() {
    const query = this.inputTarget.value
    if (query.length > 1) {
      fetch(`/patients/search?query=${encodeURIComponent(query)}`)
        .then(response => response.json())
        .then(data => {
          this.resultsTarget.innerHTML = data.map(patient => 
            `<li><a href="/main_menu?patient_id=${patient.id}">${patient.name} (${patient.furigana})</a></li>`
          ).join('')
        })
    } else {
      this.resultsTarget.innerHTML = ''
    }
  }
}
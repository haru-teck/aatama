import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "input", "results" ]

  connect() {
    console.log("PatientSearch controller connected")
  }

  search() {
    const query = this.inputTarget.value
    if (query.length < 2) {
      this.resultsTarget.innerHTML = ''
      return
    }

    fetch(`/patients/search?query=${encodeURIComponent(query)}`)
      .then(response => response.json())
      .then(data => {
        this.resultsTarget.innerHTML = data.map(patient => `
          <li>
            <a href="#" data-action="click->patient-search#selectPatient" data-patient-id="${patient.id}">
              ${patient.name} (${patient.furigana})
            </a>
          </li>
        `).join('')
      })
      .catch(error => console.error('Error:', error))
  }

  selectPatient(event) {
    event.preventDefault()
    const patientId = event.currentTarget.dataset.patientId
    
    fetch(`/patients/${patientId}/select`, {
      method: 'POST',
      headers: {
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ patient_id: patientId })
    }).then(response => {
      if (response.ok) {
        window.location.href = '/main_menu'
      } else {
        console.error('Error selecting patient')
      }
    })
  }
}
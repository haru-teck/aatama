import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "input", "results" ]

  connect() {
    console.log("PatientSearch controller connected")
  }

  search() {
    console.log("Search method called")
    const query = this.inputTarget.value
    console.log("Query:", query)

    if (query.length < 2) {
      this.resultsTarget.innerHTML = ''
      return
    }

    fetch(`/patients/search?query=${encodeURIComponent(query)}`)
      .then(response => response.json())
      .then(data => {
        console.log("Search results:", data)
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

    fetch(`/patients/search?query=${encodeURIComponent(query)}`)
      .then(response => response.json())
      .then(data => {
        console.log("Search results:", data)
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
    const patientName = event.currentTarget.textContent.trim()
    this.inputTarget.value = patientName
    this.resultsTarget.innerHTML = ''
    console.log("Patient selected:", patientId, patientName)
    // ここで選択された患者のIDをセッションに保存するなどの処理を行う
    // 例: fetch(`/patients/${patientId}/select`, { method: 'POST' })
    //     .then(() => window.location.href = '/main_menu')
    // window.location.href = '/main_menu'
  }
}
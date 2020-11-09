import { Controller } from 'stimulus'

export default class extends Controller {


  connect() {
    if (gon.controller === 'patients') {
      this.fetchExams();
    }
  }

  async fetchExams() {
    const response = await fetch(`${gon.exams_api}?by_patient=${gon.patient_id}`);
    const exams = await response.json();
    console.log(exams);
  }

  teste() {
    console.log('clicl');
  }
}

import { Controller } from 'stimulus'
import Chart from '../components/chart.svelte';
export default class extends Controller {

  static targets = ['chartContainer'];

  connect() {
    if (gon.controller === 'patients') {
      console.log('patiente controlelr');
      this.fetchExams();
    }
  }

  async fetchExams() {
    const response = await fetch(`${gon.exams_api}?by_patient=${gon.patient_id}`);
    const exams = await response.json();
    if(exams.length) {
      this.buildChartData(exams);
    }
  }

  buildChartData(exams) {
    const data = exams.reduce((prev, curr) => {

      if(prev[curr.exam_data.modality]) {
        prev[curr.exam_data.modality] += 1
      } else {
        prev[curr.exam_data.modality] = 1
      }
      return prev;
    }, {});

    new Chart({
      target: this.chartContainerTarget,
      props: {
        labels: Object.keys(data),
        dataset: Object.values(data),
      }
    });
  }

}

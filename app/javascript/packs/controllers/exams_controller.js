import { Controller } from 'stimulus'

export default class extends Controller {

  static targets = ["fileLabel", "fileInput", "submit"]
  connect() {
    console.log(this.fileLabelTarget)
  }

  readFile() {
      let filename = this.fileInputTarget.value;
      filename = filename.substring(filename.lastIndexOf('\\')+1);
      this.fileLabelTarget.innerText = filename;
      console.log('input', this.fileInputTarget);
      const fileType = this.fileInputTarget.files[0].type;
      if(fileType === "application/dicom" || fileType === '') {
        this.submitTarget.disabled = false;
      } else {
        alert("Arquivo não suportado. Favor selecionar arquivos .dcm (DICOM)");
      }
  }

}

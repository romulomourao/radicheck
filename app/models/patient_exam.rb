class PatientExam < ApplicationRecord
  self.table_name = "patients_exams"

  belongs_to :exam, class_name: '::Exams::Base'
  belongs_to :patient

  scope :by_patient, -> (patient_id)  { where(patient_id: patient_id)}
end

class PatientExam < ApplicationRecord
  self.table_name = "patients_exams"

  belongs_to :exam, class_name: '::Exams::Base', foreign_key: 'exam_id'
  belongs_to :patient

  scope :by_patient, -> (patient_id)  { where(patient_id: patient_id)}
end

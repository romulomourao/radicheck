
  module Exams
    class Base < ApplicationRecord
      self.table_name = "exams"

      enum modality: {
        nm: 0,
        dx: 1
      }

      has_one :patient_exam, foreign_key: 'exam_id'
      has_one :patient, through: :patient_exam

      scope :q, -> (query) { where("patients_name LIKE ?", "%#{query}%").or(where(cpf: query))}
      scope :by_patient, -> (id) {joins(:patient_exam).where(patients_exams: { patient_id: id })}

    end
  end

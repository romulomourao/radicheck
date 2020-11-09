
  module Exams
    class Base < ApplicationRecord
      self.table_name = "exams"

      enum modality: {
        nm: 0,
        dx: 1
      }

      has_one :patient_exam
      has_one :patient, through: :patient_exam

    end
  end
